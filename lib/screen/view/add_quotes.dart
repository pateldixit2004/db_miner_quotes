import 'package:db_miner_quotes/screen/controller/quo_controller.dart';
import 'package:db_miner_quotes/screen/model/caregory_model.dart';
import 'package:db_miner_quotes/utils/database_helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class AddQuoScreen extends StatefulWidget {
  const AddQuoScreen({Key? key}) : super(key: key);

  @override
  State<AddQuoScreen> createState() => _AddQuoScreenState();
}

class _AddQuoScreenState extends State<AddQuoScreen> {
  QuoController controller = Get.put(QuoController());
  TextEditingController txtquo = TextEditingController();
  TextEditingController txtname = TextEditingController();
  var txtkey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    controller.getData();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Form(
        key: txtkey,
        child: Scaffold(
          body: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                TextFormField(
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Enter the quotes";
                    }
                  },
                  controller: txtquo,
                  maxLines: 5,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15.sp),
                          borderSide: BorderSide(color: Colors.redAccent)),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15.sp),
                          borderSide: BorderSide(color: Colors.redAccent)),
                      hintText: 'Enter the Quotes'),
                ),
                SizedBox(
                  height: 7,
                ),
                TextFormField(
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Enter the auther";
                    }
                  },
                  controller: txtname,
                  maxLines: 1,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15.sp),
                          borderSide: BorderSide(color: Colors.redAccent)),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15.sp),
                          borderSide: BorderSide(color: Colors.redAccent)),
                      hintText: 'Enter the auther'),
                ),
                SizedBox(height: 20,),
                Container(
                  height: 6.5.h,
                  width: 90.w,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.sp),
                      color: Colors.redAccent),
                  child: Obx(
                    () =>  DropdownButton(
                      isExpanded: true,
                      value: controller.selectItem.value,
                      underline: SizedBox(),
                      items: controller.catList
                          .asMap()
                          .entries
                          .map((e) => DropdownMenuItem(
                                child:
                                    Center(child: Text("${controller.catList[e.key]['cat']}",style: TextStyle(color: Colors.black),)),
                                value: controller.catList[e.key]['cat'],
                              ))
                          .toList(),
                      onChanged: (value) {
                        controller.selectItem.value=value as String;
                      },

                    ),
                  ),
                ),
                SizedBox(height: 3.h,),
                ElevatedButton(onPressed: () {

                  QuotesModel model=QuotesModel(name: txtname.text,quo: txtquo.text,cat: controller.selectItem.value);
                  DbHelper.dbHelper.insertQuoDb(model);
                  controller.getQuoData(controller.selectItem.value);
                  Get.back();
                }, child: Text('Add quotes'))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
