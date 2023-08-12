import 'package:db_miner_quotes/screen/controller/quo_controller.dart';
import 'package:db_miner_quotes/screen/model/caregory_model.dart';
import 'package:db_miner_quotes/utils/database_helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddCatScreen extends StatefulWidget {
  const AddCatScreen({Key? key}) : super(key: key);

  @override
  State<AddCatScreen> createState() => _AddCatScreenState();
}

class _AddCatScreenState extends State<AddCatScreen> {
  QuoController controller = Get.put(QuoController());
  TextEditingController txtCat = TextEditingController();
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
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                TextFormField(
                  validator: (value) {
                    if(value!.isEmpty)
                      {
                        return "Enter the category";
                      }
                  },
                  controller: txtCat,
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    hintText: "Enter the category"
                  ),
                ),
                SizedBox(height: 30,),
                ElevatedButton(onPressed: () {
                  if(txtkey.currentState!.validate())
                    {
                      CetegoryModel model=CetegoryModel(cat: txtCat.text);
                      DbHelper.dbHelper.insertCatDb(model);
                      controller.getData();
                      Get.back();
                    }
                }, child: Text("Add category"))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
