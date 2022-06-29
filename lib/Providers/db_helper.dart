import 'package:auto_valley/models/Taking_Picture/Picture%20model.dart';
import 'package:sqflite/sqflite.dart' as sql;
import 'package:path/path.dart' as p;
import 'package:sqflite/sqflite.dart';

class dbHelper{

  static Future<sql.Database> DataBase() async{
    return await sql.openDatabase(p.join(await sql.getDatabasesPath(),'Place_Depository.db'),
        onCreate: (db, ver) {
          db.execute("CREATE TABLE Picture(id TEXT PRIMARY KEY, photo_name TEXT )");
        },version: 1);

  }
  static Future<void> insert(String Table,Map<String,Object> data) async{
    final db = await dbHelper.DataBase();
    db.insert(
        Table,
        data,
        conflictAlgorithm: sql.ConflictAlgorithm.replace);
  }

  static void savePicture(Photo picture) async {
    final db = await dbHelper.DataBase();
    var dbClient = await db;
    await dbClient.insert("Picture", picture.toMap(),conflictAlgorithm: ConflictAlgorithm.replace);
  }

  static Future<List<Map<String,dynamic>>> getData(String table) async{
    final db = await dbHelper.DataBase();
    return db.query(table);
  }

  static Future<List<Photo>> get Pictures async {
    final db = await dbHelper.DataBase();
    var dbClient = await db;
    List<Map> list = await dbClient.rawQuery('SELECT * FROM Picture');
    List<Photo> pictures =  [];
    for (int i = 0; i < list.length; i++) {
      pictures.add( Photo(id:list[i]["id"],photo_name:  list[i]["photo_name"]));
    }
    return pictures;
  }

  static Future<String>  SpecificImg(String PicName) async {
    final db = await dbHelper.DataBase();
    var dbClient = await db;
    List<Map> list = await dbClient.rawQuery('SELECT * FROM Picture');
    List<Photo> pictures =  [];
    for (int i = 0; i < list.length; i++) {
      if(list[i]["photo_name"] == PicName){
          return list[i]["photo_name"];
      }
    }
    return 'null';
  }
}
