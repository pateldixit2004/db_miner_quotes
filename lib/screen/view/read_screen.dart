import 'package:db_miner_quotes/screen/controller/quo_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:sizer/sizer.dart';

import '../../utils/database_helper.dart';

class ReadScreen extends StatefulWidget {
  const ReadScreen({Key? key}) : super(key: key);

  @override
  State<ReadScreen> createState() => _ReadScreenState();
}

class _ReadScreenState extends State<ReadScreen> {
  QuoController controller = Get.put(QuoController());
  String? cat;

  @override
  void initState() {
    super.initState();
    cat = Get.arguments;

    controller.getQuoData(cat);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Obx(
          () => ListView.builder(
            itemBuilder: (context, index) {
              return Container(
                height: 25.h,
                width: 90.w,
                padding: EdgeInsets.all(10.sp),
                margin: EdgeInsets.symmetric(horizontal: 10.sp, vertical: 5.sp),
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                    borderRadius: BorderRadius.circular(15.sp),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                          blurRadius: 5,
                          color: Colors.grey,
                          spreadRadius: 1,
                          offset: Offset(0, 0))
                    ]),
                child: Column(
                  children: [
                    Text("${controller.QuoList[index]['quo']}"),
                    SizedBox(
                      height: 5.sp,
                    ),
                    Text("${controller.QuoList[index]['name']}"),
                    Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Icon(Icons.done_all),
                        // IconButton(onPressed: () {
                        //   UpdateModel m = UpdateModel(
                        //       statu: 1,
                        //       index: index
                        //   );
                        //   Get.toNamed('tab',arguments: m);
                        // },icon: Icon(Icons.edit)),
                        IconButton(
                            onPressed: () {
                              DbHelper.dbHelper
                                  .deleteQuo(controller.QuoList[index]['id']);
                              controller.getQuoData(cat);
                            },
                            icon: Icon(Icons.delete)),
                        IconButton(
                            onPressed: () {
                              // Share.share('${controller.quotesList[index]['quote']}');
                            },
                            icon: Icon(Icons.share)),
                      ],
                    ),
                  ],
                ),
              );
            },
            itemCount: controller.QuoList.length,
          ),
        ),
      ),
    );
  }
}
