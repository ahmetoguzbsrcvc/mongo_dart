import 'package:mongo_dart/src/commands/base/server_command.dart';

import '../../core/error/mongo_dart_error.dart';
import '../../topology/abstract/topology.dart';
import '../../topology/server.dart';
import '../../utils/map_keys.dart';
import '../parameters/read_preference.dart'
    show ReadPreference, ReadPreferenceMode;

/// Run a simple command
///
/// Designed for system commands where Db/Collection are not needed
class SimpleCommand extends ServerCommand {
  SimpleCommand(this.topology, super.command, super.options,
      {super.aspect, ReadPreference? readPreference})
      : super();

  /// The ReadPreference Object has prefernce with respect to the options
  /// ReadPrefernce Specs
  ReadPreference? readPreference;
  Topology topology;

  @override
  Future<Map<String, Object?>> execute() async {
    Server? server;
    if (topology.type == TopologyType.standalone) {
      ReadPreference.removeReadPreferenceFromOptions(options);
      server = topology.primary;
    } else if (topology.type == TopologyType.replicaSet) {
      server = topology.getServer(
          readPreferenceMode:
              readPreference?.mode ?? ReadPreferenceMode.primary);
    } else if (topology.type == TopologyType.shardedCluster) {
      server = topology.getServer();
      readPreference ??= options[keyReadPreference] == null
          ? null
          : ReadPreference.fromOptions(options, removeFromOriginalMap: true);
      if (readPreference != null) {
        options = {...options, ...readPreference!.toMap()};
      }

      ReadPreference.removeReadPreferenceFromOptions(options);
    }

    return super.executeOnServer(
        server ?? (throw MongoDartError('No server detected')));
  }

  @override
  Future<Map<String, Object?>> executeOnServer(Server server) async =>
      throw MongoDartError('Do not use this methos, use execute instead');
}
