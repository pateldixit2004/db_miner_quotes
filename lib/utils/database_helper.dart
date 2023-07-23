import 'dart:io';

import 'package:db_miner_quotes/screen/model/category_model.dart';
import 'package:db_miner_quotes/screen/model/quotes_model.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DbHelper
{
  static final helper=DbHelper._();
  DbHelper._();

  Database? database;
  final String? dbpath='database.db';
  final String? datatable='datatable';
  final String? quotestable="quotestable";



  Future<Database?> checkDb()
  async {
    if(database!=null)
      {
        return database;
      }
    else
      {
        return await intitDb();
      }
  }


  Future<Database> intitDb()
  async {
    Directory dir = await getApplicationDocumentsDirectory();
    String? path=join(dir.path,dbpath);

    return await openDatabase(path,version: 1,onCreate: (db, version) async {

      await db.execute('CREATE TABLE $datatable(id INTEGER PRIMARY KEY AutoIncrement  ,cat TEXT)');
      await db.execute('CREATE TABLE $quotestable(id INTEGER PRIMARY KEY AutoIncrement  ,quo TEXT,cat TEXT)');

    },);

  }


  Future<void> insertcategortDb({CategoryModel? model})
  async {
    database=await checkDb();
    await database!.insert("$datatable", {
      'cat': model!.cat,
      'img': model.img
    });
  }

  Future<List<Map>> readcategoryDb()
  async {
    database=await checkDb();
    String? query="SELECT * FROM $datatable";
    List<Map> l1=await database!.rawQuery(query);
    return l1;
  }


  Future<Future<int>> insertQuotesdb({QuotesModel? model})
  async {
    database=await checkDb();
    return database!.insert("${quotestable}", {
      'quo':model!.quotes,
      'cat': model.cat,

    });
  }


  Future<List<Map>> readQuotesDb({required cat})
  async {
    database=await checkDb();
    String? query="SELECT * FROM $quotestable WHERE cat ='$cat";
    List<Map> l1=await database!.rawQuery(query);
    return l1;
  }
}