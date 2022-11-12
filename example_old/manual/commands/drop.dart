import 'package:mongo_dart/src/mongo_client.dart';

const dbName = 'mongo-dart-example';
const dbAddress = '127.0.0.1';

const defaultUri = 'mongodb://$dbAddress:27017/$dbName';

void main() async {
  var client = MongoClient(defaultUri);
  await client.connect();
  var db = client.db();
  Future cleanupDatabase() async {
    await db.drop();
    await client.close();
  }

  var collectionName = 'test-drop';
  await db.dropCollection(collectionName);
  var ret = await db.modernListCollections().toList();
  var retNum = ret.length;
  await db.createCollection(collectionName);

  ret = await db.modernListCollections().toList();

  var retNum2 = ret.length;

  if (retNum2 != retNum + 1) {
    print('Sorry, some error occured');
    return;
  }

  await db.dropCollection(collectionName);
  ret = await db.modernListCollections().toList();

  if (retNum != ret.length) {
    print('Sorry, some error occured');
    return;
  }

  print('Added collection has been correctly removed');

  await cleanupDatabase();
}
