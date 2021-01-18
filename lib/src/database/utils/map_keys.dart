const aggregateChangeStream = r'$changeStream';

const bulkInsertOne = 'insertOne';
const bulkInsertMany = 'insertMany';
const bulkUpdateOne = 'updateOne';
const bulkUpdateMany = 'updateMany';
const bulkReplaceOne = 'replaceOne';
const bulkDeleteOne = 'deleteOne';
const bulkDeleteMany = 'deleteMany';
const bulkDocument = 'document';
const bulkDocuments = 'documents';
const bulkFilter = 'filter';
const bulkUpdate = 'update';
const bulkReplacement = 'replacement';

const keyAdvisoryHostFQDNs = 'advisoryHostFQDNs';
const keyAfterClusterTime = 'afterClusterTime';
const keyAggregate = 'aggregate';
const keyAllowDiskUse = 'allowDiskUse';
const keyAllowPartialResult = 'allowPartialResult';
const keyAlternate = 'alternate';
const keyAsserts = 'asserts';
const keyAuthdb = 'authdb';
const keyAutoIndexId = 'autoIndexId';
const keyAwaitData = 'awaitData';
const keyBackground = 'background';
const keyBackwards = 'backwards';
const keyBatchSize = 'batchSize';
const keyBypassDocumentValidation = 'bypassDocumentValidation';
const keyCapped = 'capped';
const keyCaseFirst = 'caseFirst';
const keyCaseLevel = 'caseLevel';
const keyClusterTime = 'clusterTime';
const keyCode = 'code';
const keyCodeName = 'codeName';
const keyColl = 'coll';
const keyCollation = 'collation';
const keyCollection = 'collection';
const keyComment = 'comment';
const keyConnectionId = 'connectionId';
const keyConnections = 'connections';
const keyCreate = 'create';
const keyCreateIndexes = 'createIndexes';
const keyCreateIndexesArgument = 'indexes';
const keyCursor = 'cursor';
const keyCursors = 'cursors';
const keyCursorsAlive = 'cursorsAlive';
const keyCursorsKilled = 'cursorsKilled';
const keyCursorsNotFound = 'cursorsNotFound';
const keyCursorsUnknown = 'cursorsUnknown';
const keyDatabaseName = r'$db';
const keyDb = 'db';
const keyDbHash = 'dbHash';
const keyDbName = 'dbName';
const keyDbStats = 'dbStats';
const keyDefaultRWConcern = 'defaultRWConcern';
const keyDelete = 'delete';
const keyDeletes = 'deletes';
const keyDeleteArgument = 'deletes';
const keyDocuments = 'documents';
const keyDropDuplicatedEntries = 'dropDups';
const keyElectionMetrics = 'electionMetrics';
const keyErrmsg = 'errmsg';
const keyExpireAfterSeconds = 'expireAfterSeconds';
const keyExplain = 'explain';
const keyExtraInfo = 'extra_info';
const keyFeatureCompatibilityVersion = 'featureCompatibilityVersion';
const keyFieldHash = 'fieldHash';
const keyFilter = 'filter';
const keyFind = 'find';
const keyFirstBatch = 'firstBatch';
const keyFlowControl = 'flowControl';
const keyFormatVersion = 'v';
const keyFreeMonitoring = 'freeMonitoring';
const keyFsync = 'fsync';
const keyFull = 'full';
const keyFullDocument = 'fullDocument';
const keyGeoLowerBound = 'min';
const keyGeoHighBound = 'max';
const keyGetMore = 'getMore';
const keyGetLastError = 'getLastError';
const keyGetParameter = 'getParameter';
const keyGlobalLock = 'globalLock';
const keyHash = 'hash';
const keyHedgingMetrics = 'hedgingMetrics';
const keyHint = 'hint';
const keyHost = 'host';
const keyHosts = 'hosts';
const key_id = '_id';
const keyId = 'id';
const keyIndex = 'index';
const keyIndexName = 'name';
const keyIndexOptionDefaults = 'indexOptionDefaults';
const keyInsert = 'insert';
const keyInsertArgument = 'documents';
const keyInsertedCount = 'insertedCount';
const keyInsertedId = 'insertedId';
const keyJ = 'j';
const keyKey = 'key';
const keyKeyId = 'keyId';
const keyKillCursors = 'killCursors';
const keyLatchAnalysis = 'latchAnalysis';
const keyLevel = 'level';
const keyLimit = 'limit';
const keyLocale = 'locale';
const keyLocalTime = 'localTime';
const keyLocks = 'locks';
const keyLog = 'log';
const keyLogLevel = 'logLevel';
const keyLogicalSessionRecordCache = 'logicalSessionRecordCache';
const keyMax = 'max';
const keyMaxAwaitTimeMS = 'maxAwaitTimeMS';
const keyMaxBsonObjectSize = 'maxBsonObjectSize';
const keyMaximumLogFileSize = 'maximum log file size';
const keyMaxMessageSizeBytes = 'maxMessageSizeBytes';
const keyMaxStalenessSecond = 'maxStalenessSeconds';
const keyMaxTimeMS = 'maxTimeMS';
const keyMaxVariable = 'maxVariable';
const keyMaxWriteBatchSize = 'maxWriteBatchSize';
const keyMem = 'mem';
const keyMetrics = 'metrics';
const keyMin = 'min';
const keyMirroredReads = 'mirroredReads';
const keyMode = 'mode';
const keyMsg = 'msg';
const keyN = 'n';
const keyName = 'name';
const keyNetwork = 'network';
const keyNextBatch = 'nextBatch';
const keyNModified = 'nModified';
const keyNoCursorTimeout = 'noCursorTimeout';
const keyNormalization = 'normalization';
const keyNs = 'ns';
const keyNumericOrdering = 'numericOrdering';
const keyOk = 'ok';
const keyOpcounters = 'opcounters';
const keyOpcountersRepl = 'opcountersRepl';
const keyOperationTime = 'operationTime';
const keyOperationType = 'operationType';
const keyOpLatencies = 'opLatencies';
const keyOplogReplay = 'oplogReplay';
const keyOplogTruncation = 'oplogTruncation';
const keyOpReadConcernCounters = 'opReadConcernCounters';
const keyOps = 'ops';
const keyOpWriteConcernCounters = 'opWriteConcernCounters';
const keyOrdered = 'ordered';
const keyParameter = 'parameter';
const keyPartialFilterExpression = 'partialFilterExpression';
const keyPartialResultsReturned = 'partialResultsReturned';
const keyPersistent = 'persistent';
const keyPid = 'pid';
const keyPipeline = 'pipeline';
const keyPreference = 'preference';
const keyProcess = 'process';
const keyProjection = 'projection';
const keyProvenance = 'provenance';
const keyQ = 'q';
const key$Query = r'$query';
const keyReadConcern = 'readConcern';
const keyReadPreference = 'readPreference';
const keyReadPreferenceTags = 'readPreferenceTags';
const keyRepl = 'repl';
const keyResult = 'result';
const keyResumeAfter = 'resumeAfter';
const keyReturnKey = 'returnKey';
const keyScaleFactor = 'scaleFactor';
const keySecurity = 'security';
const keyServerStatus = 'serverStatus';
const keySession = 'session';
const keySetName = 'setName';
const keySharding = 'sharding';
const keyShardedIndexConsistency = 'shardedIndexConsistency';
const keyShardingStatistics = 'shardingStatistics';
const keyShowRecordId = 'showRecordId';
const keySingleBatch = 'singleBatch';
const keySize = 'size';
const keySkip = 'skip';
const keySort = 'sort';
const keySparseIndex = 'sparse';
const keyStartAfter = 'startAfter';
const keyStartAtOperationTime = 'startAtOperationTime';
const keyStorageEngine = 'storageEngine';
const keyStrength = 'strength';
const keyTags = 'tags';
const keyTailable = 'tailable';
const keyTopologyVersion = 'topologyVersion';
const keyTotalSize = 'totalSize';
const keyTransactions = 'transactions';
const keyTransportSecurity = 'transportSecurity';
const keyUniqueIndex = 'unique';
const keyUpdate = 'update';
const keyUpdateArgument = 'updates';
const keyUpserted = 'upserted';
const keyUptime = 'uptime';
const keyUptimeMillis = 'uptimeMillis';
const keyUptimeEstimate = 'uptimeEstimate';
const keyValidator = 'validator';
const keyValidationLevel = 'validationLevel';
const keyValidationAction = 'validationAction';
const keyVersion = 'version';
const keyViewOn = 'viewOn';
const keyW = 'w';
const keyWatchdog = 'watchdog';
const keyWiredTiger = 'wiredTiger';
const keyWriteBacksQueued = 'writeBacksQueued';
const keyWriteConcern = 'writeConcern';
const keyWriteConcernError = 'writeConcernError';
const keyWriteError = 'writeError';
const keyWriteErrors = 'writeErrors';
const keyWtimeout = 'wtimeout';
