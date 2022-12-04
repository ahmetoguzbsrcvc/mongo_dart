import 'dart:async';

import 'package:logging/logging.dart';
import 'package:mongo_dart/src/core/error/connection_exception.dart';

import '../info/server_config.dart';
import 'abstract/connection_base.dart';
import 'abstract/connection_events.dart';

enum PoolState { closed, connected, unknown }

class ConnectionPool {
  ConnectionPool(this.serverConfig);

  final log = Logger('Connection Pool');

  ServerConfig serverConfig;
  PoolState state = PoolState.closed;
  final Set<ConnectionBase> _connections = <ConnectionBase>{};
  final Map<int, ConnectionBase> availableConnections = <int, ConnectionBase>{};
  bool doNotAcceptAnyRequest = false;

  bool get isConnected => state == PoolState.connected;
  int get connectionsNumber => _connections.length;

  Future<void> connectPool() async {
    if (state == PoolState.connected) {
      return;
    }
    if (availableConnections.isNotEmpty) {
      state = PoolState.connected;
      return;
    }
    ConnectionBase connection;

    connection = _connections.firstWhere((element) => element.isClosed,
        orElse: addConnection);

    await connectConnection(connection);
  }

  ConnectionBase addConnection() {
    var connection = ConnectionBase(serverConfig);
    addListeners(connection);
    _connections.add(connection);
    return connection;
  }

  Future<void> connectConnection(ConnectionBase connection) async =>
      await connection.connect();

  ConnectionBase removeConnection(int id) {
    var connection = _connections.firstWhere((element) => element.id == id);
    connection.close();
    removeListeners(connection);
    _connections.remove(connection);
    return connection;
  }

  Future<ConnectionBase> getAvailableConnection() async {
    if (availableConnections.isNotEmpty) {
      return pickAvailableConnection();
    }
    var connection = addConnection();
    await connectConnection(connection);
    return pickAvailableConnection();
  }

  ConnectionBase pickAvailableConnection() {
    if (availableConnections.isEmpty) {
      throw ConnectionException('No available Connection');
    }
    var entry = availableConnections.entries.first;
    availableConnections.remove(entry.key);
    log.info('Got available connection No ${entry.value.id}');
    return entry.value;
  }

  void addListeners(ConnectionBase connection) {
    connection.on<ConnectionError>(connectionErrorListener);
    connection.on<Connected>(connectedListener);
    connection.on<ConnectionClosed>(connectionClosedListener);
    connection.on<ConnectionActive>(connectionActive);
    connection.on<ConnectionAvailable>(connectionAvailable);
    connection.on<ConnectionMessageReceived>(connectionMessageReceived);
  }

  void removeListeners(ConnectionBase connection) {
    connection.off<ConnectionError>(connectionErrorListener);
    connection.off<Connected>(connectedListener);
    connection.off<ConnectionClosed>(connectionClosedListener);
    connection.off<ConnectionActive>(connectionActive);
    connection.off<ConnectionAvailable>(connectionAvailable);
    connection.off<ConnectionMessageReceived>(connectionMessageReceived);
  }

  Future<void> closePool() async {
    doNotAcceptAnyRequest = true;
    for (var connection in _connections) {
      await connection.close();
    }
    state = PoolState.closed;
    doNotAcceptAnyRequest = false;
  }

  // *************  Listeners ************************
  FutureOr<void> connectionErrorListener(ConnectionError event) {
    _connections.removeWhere((element) => element.id == event.id);
    if (_connections.isEmpty) {
      state = PoolState.closed;
    }
  }

  FutureOr<void> connectedListener(Connected event) =>
      state = PoolState.connected;

  FutureOr<void> connectionClosedListener(ConnectionClosed event) {
    availableConnections.remove(event.id);
    _connections.removeWhere((element) => element.id == event.id);
    if (_connections.isEmpty) {
      state = PoolState.closed;
    }
  }

  FutureOr<void> connectionActive(ConnectionActive event) {
    log.info('Connection ${event.id} active');
    availableConnections.remove(event.id);
  }

  FutureOr<void> connectionAvailable(ConnectionAvailable event) {
    log.info('Connection ${event.id} available');

    availableConnections[event.id] =
        _connections.firstWhere((element) => element.id == event.id);
  }

  FutureOr<void> connectionMessageReceived(ConnectionMessageReceived event) {
    log.info('Received message on connection ${event.id}');
    availableConnections[event.id] =
        _connections.firstWhere((element) => element.id == event.id);
  }
}
