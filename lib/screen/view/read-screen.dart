import 'package:db_miner_quotes/screen/controller/quotes_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class ReadScreen extends StatefulWidget {
  const ReadScreen({Key? key}) : super(key: key);

  @override
  State<ReadScreen> createState() => _ReadScreenState();
}

class _ReadScreenState extends State<ReadScreen> {
  QuotesController controller = Get.put(QuotesController());
  String? cat;
  @override
  void initState() {
    super.initState();
    cat=Get.arguments;
    controller.GetqutoesData(cat);
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      body: ListView.builder(itemBuilder: (context, index) {
        return Container(
          height: 25.h,
          width: 90.w,
          child: Column(
            children: [
              Text("${controller.quotesList[index]['quo']}"),
              // Text("${controller.quotesList[index]['catogery']}"),
            ],
          ),
        );
      },itemCount: controller.quotesList.length,),
    ),);
  }
}
