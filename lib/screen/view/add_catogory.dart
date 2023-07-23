import 'package:db_miner_quotes/screen/controller/quotes_controller.dart';
import 'package:db_miner_quotes/screen/model/category_model.dart';
import 'package:db_miner_quotes/utils/database_helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class CatogoryScreen extends StatefulWidget {
  const CatogoryScreen({Key? key}) : super(key: key);

  @override
  State<CatogoryScreen> createState() => _CatogoryScreenState();
}

class _CatogoryScreenState extends State<CatogoryScreen> {
  QuotesController controller = Get.put(QuotesController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            ListTile(
              leading: Text(
                "Category",
                style: TextStyle(
                    color: Colors.black, fontWeight: FontWeight.bold),
              ),
            ),
            Obx(() =>  Container(
                child: DropdownButton(
                  value: controller.categry.value,
                  isExpanded: true,
                  onChanged: (value) {
                    controller.categry.value=value!;
                  },
                  items: controller.categryList.map((element) => DropdownMenuItem(child: Text("$element"),value: element,)).toList(),
                ),
              ),
            ),
           ElevatedButton(onPressed: () {

             CategoryModel model=CategoryModel(
               cat:controller.categry.value,
             );
             DbHelper.helper.insertcategortDb(model: model);
             controller.GetCatogoryData();
             Get.toNamed('/quo');
           }, child: Text("Submit"))
          ],
        ),
      ),
    );
  }
}
