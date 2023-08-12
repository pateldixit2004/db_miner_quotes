import 'dart:io';

import 'package:db_miner_quotes/screen/model/caregory_model.dart';
import 'package:flutter/foundation.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DbHelper
{
  static final DbHelper dbHelper=DbHelper._();
  DbHelper._();
  Database? database;
  final String? dbpath='database.db';
  final String? quotes_table='quotes';
  final String? category_table='category';

  Future<Database?> checkDb() async {
    if (database != null) {
      return database;
    } else {
      return await initDb();
    }
  }

  Future<Database> initDb()
  async {
    Directory dir = await getApplicationDocumentsDirectory();
    String? path=join(dir.path,dbpath);
    return await openDatabase(path,version: 1,onCreate: (db, version) async {
      await db.execute("CREATE TABLE $category_table (id INTEGER PRIMARY KEY AutoIncrement,cat TEXT)");
      await db.execute("CREATE TABLE $quotes_table (id INTEGER PRIMARY KEY AutoIncrement,name TEXT, quo TEXT,cat TEXT)");
    },);
  }

  Future<Future<int>> insertCatDb(CetegoryModel model)
  async {
    database=await checkDb();
    return database!.insert('$category_table', {
      'cat':model.cat,
    });
  }

  Future<List<Map>> readCatData()
  async {
    database=await checkDb();
    String? query='SELECT * FROM $category_table';
    List<Map> list=await database!.rawQuery(query);
    return list;
  }

  Future<Future<int>> insertQuoDb(QuotesModel model)
  async {
    database=await checkDb();
    return database!.insert('$quotes_table', {
      'name':model.name,
      'quo':model.quo,
      'cat':model.cat,
    });
  }

  Future<List<Map>> readQuoData({required cat})
  async {
    database=await checkDb();
    String? query='SELECT *FROM $quotes_table WHERE cat="$cat"';
    List<Map> list=await database!.rawQuery(query);
    return list;
  }

  Future<Future<int>> deleteQuo(id)
  async {
    database=await checkDb();
    return database!.delete("$quotes_table",whereArgs: [id],where: "id=?");
  }

  Future<Future<int>> deleteCat(id)
  async {
    database=await checkDb();
    return database!.delete("$category_table",where: "id=?",whereArgs: [id]);
  }

  Future<Future<int>> update({required QuotesModel model,required id})
  async {
    database=await checkDb();
    return database!.update(quotes_table!, {
      'name':model.name,
      'quo':model.quo,
      'cat':model.cat,
    },where: "id=?",whereArgs: [id]);
  }

}