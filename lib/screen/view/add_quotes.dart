import 'package:db_miner_quotes/screen/controller/quotes_controller.dart';
import 'package:db_miner_quotes/screen/model/quotes_model.dart';
import 'package:db_miner_quotes/utils/database_helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class Quotes extends StatefulWidget {
  const Quotes({Key? key}) : super(key: key);

  @override
  State<Quotes> createState() => _QuotesState();
}

class _QuotesState extends State<Quotes> {
  QuotesController controller = Get.put(QuotesController());

  TextEditingController txtquotes = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Container(
              height: 5.h,
              width: 90.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(2.h),
                color: Colors.red
              ),
              child: Text("Quotes"),
            ),
            SizedBox(height: 2.h,),
            TextFormField(
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Enter the Quotes';
                }
              },
              controller: txtquotes,
              maxLines: 5,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15.sp),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15.sp),
                  ),
                  hintText: 'Enter the Quotes  '),
            ),
            SizedBox(height: 2.h,),

            Container(
              height: 5.h,
              width: 85.w,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.sp),
                  color: Colors.red),
              child: Obx(() =>  DropdownButton(
                  style: TextStyle(color: Colors.black),
                  dropdownColor: Colors.red.shade900,
                  value: controller.categry.value,
                  underline: Container(),
                  alignment: Alignment.center,
                  icon: Container(),
                  items: controller.catList
                      .asMap()
                      .entries
                      .map((e) => DropdownMenuItem(
                    child: Text(
                        "${controller.catList[e.key]['cat']}",
                        ),
                    alignment: Alignment.center,
                    value: controller.catList[e.key]['cat'],
                  ))
                      .toList(),
                  onChanged: (value) {
                    controller.categry.value = value as String;
                  },
                  isExpanded: true,
                ),
              ),
            ),

            ElevatedButton(onPressed: () {
              QuotesModel model=QuotesModel(
                quotes:txtquotes.text,cat:controller.categry.value
              );

              DbHelper.helper.insertQuotesdb(model: model);
              controller.GetCatogoryData();
              Get.offAllNamed('/');
            }, child: Text("Add Quotes"))
          ],
        ),
      ),
    );
  }
}
