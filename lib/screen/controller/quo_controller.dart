import 'package:db_miner_quotes/utils/database_helper.dart';
import 'package:get/get.dart';

class QuoController extends GetxController
{
  RxList catList=[].obs;
  RxList QuoList=[].obs;
  RxString selectItem = ''.obs;
  List defaultCategoryList=["Love","Motivation","Sad"];

  Future<void> getData()
  async {
    catList.value=await DbHelper.dbHelper.readCatData();
    if(catList.isNotEmpty)
      {
        selectItem.value=catList[0]['cat'];
      }
  }

  Future<void> getQuoData(cat)
  async {
    QuoList.value=await DbHelper.dbHelper.readQuoData(cat: cat);
  }
}