import 'package:db_miner_quotes/utils/database_helper.dart';
import 'package:get/get.dart';

class QuotesController extends GetxController
{
  RxString categry="Love".obs;
  RxList<String> categryList=[
    "Motivational","Love","Swami vivekananda","Ratan tata",
  ].obs;

  RxList catList=[].obs;
  RxList quotesList=[].obs;

  Future<void> GetCatogoryData()
  async {
    catList.value=await DbHelper.helper.readcategoryDb();
  }

  Future<void> GetqutoesData(cat)
  async {
    quotesList.value=await DbHelper.helper.readQuotesDb(cat: cat);
  }


}