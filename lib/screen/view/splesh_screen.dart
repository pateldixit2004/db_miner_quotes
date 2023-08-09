import 'dart:async';

import 'package:db_miner_quotes/screen/controller/quo_controller.dart';
import 'package:db_miner_quotes/screen/model/caregory_model.dart';
import 'package:db_miner_quotes/utils/database_helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SpleshScreen extends StatefulWidget {
  const SpleshScreen({Key? key}) : super(key: key);

  @override
  State<SpleshScreen> createState() => _SpleshScreenState();
}

class _SpleshScreenState extends State<SpleshScreen> {
  QuoController controller = Get.put(QuoController());

  @override
  void initState() {
    super.initState();
    getData();
  }

  void getData() async {
    await controller.getData();

    if (controller.catList.isEmpty) {
      for (var x in controller.defaultCategoryList) {
        DbHelper.dbHelper.insertCatDb(CetegoryModel(cat: x));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    Timer(
      Duration(seconds: 3),
      () => Get.offAllNamed('/home'),
    );

    return SafeArea(
      child: Scaffold(
        body: Center(
          child: FlutterLogo(
            size: 150,
          ),
        ),
      ),
    );
  }
}
