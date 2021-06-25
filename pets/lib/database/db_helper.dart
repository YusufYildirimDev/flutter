import 'dart:async';
import 'dart:collection';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:pets/models/User.dart';

class DatabaseHelper{

    static final _databaseName="userdb.db";
    static final _databaseVersion=1;
    static final table="usertable";
    static final columnId='id';
    static final columnUsername='username';
    static final columnPassword='password';

    DatabaseHelper._privateConstructor();
    static final DatabaseHelper instance=DatabaseHelper._privateConstructor();
    static Database _database;
    //Future <Database> _database;

    Future<Database> get database async{
      if(_database!=null) return _database;
      _database=await _initDatabase();
      return _database; 
    }

  _initDatabase() async{
    String path = join(await getDatabasesPath(), _databaseName);
    return await openDatabase(
      path,
      version: _databaseVersion,
      onCreate: _onCreate
      );
  }



  Future _onCreate(Database db, int version) async{
    await db.execute('''
      CREATE TABLE $table (
        $columnId INTEGER PRIMARY KEY AUTOINCREMENT,
        $columnUsername TEXT,
        $columnPassword TEXT
      )
      '''
    );
  }

 /* Future<int> insert(User user) async{
    Database db=await instance.database;
   // Database db=await this.database;
    return await db.insert(table, {"usernme":user.username, "password":user.password});
    /*var result=await db.insert("$table", user.toMap());
    return result;*/
  }*/

 /* Future<int> insert(Map<String, dynamic> row) async{
    Database db = await instance.database;
    return await db.insert(table, row);
  }*/

  Future<User> insert (User user) async{
    user.id=await _database.rawInsert("INSERT INTO $table (username,password) VALUES (${user.username},${user.password})");
    return user;
  }

  Future<int> update(User user) async{
    Database db=await instance.database;
    int id=user.toMap()['id'];
    return await db.update(table, user.toMap(), where: '$columnId=?', whereArgs: [id]);
  }

  Future<int> delete(int id) async{
    Database db = await instance.database;
    return await db.delete(table,where: '$columnId=?', whereArgs:[id] );
  }

  Future<List<Map<String,dynamic>>> queryRows(username) async{
    Database db=await instance.database;
    return await db.query(table, where:"$columnUsername LIKE '%$username%' ");
  }
  
  Future<List<Map<String,dynamic>>> queryAllRows() async{
    Database db = await instance.database;
    return await db.query(table);
  }
  
}