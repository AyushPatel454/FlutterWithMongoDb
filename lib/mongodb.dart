import 'dart:developer';

import 'package:flutter_mongodb/constant.dart';
import 'package:mongo_dart/mongo_dart.dart';

class MongoDatabase {
  static connect() async {
    var db = await Db.create(MONGO_URL); // create token of connection
    await db.open(); // open connection
    inspect(db); // show database setting. like whatever cluster setting
    var status = db.serverStatus();
    print(status);
    var collection = db.collection(COLLECTION_NAME); // call the collection // this line use to delete , update, save anything on mongo database.
    // await collection.insertMany([{ // insert document (row) in collection. // insert multiple document (rows) // ---> collection.insertOne() ---> for insert only one document (rows)
    //   "username":"amy",
    //   "name":"Amy Sadhu",
    //   "email":"amy@gmail.com"
    // },
    // {
    //   "username":"amruta",
    //   "name":"Amruta Sadhu",
    //   "email":"amruta@gmail.com"
    // }]);

    // update
    // name: ash patel ----> name: Ayush
    await collection.update(where.eq('username', 'ash'), modify.set('name', 'Ayush')); // update single document (Row)
    // collection.updateMany() ---> for update many documents.
    print(await collection.find().toList());
  }
}