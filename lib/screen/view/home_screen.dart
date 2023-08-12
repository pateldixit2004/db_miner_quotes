import 'package:db_miner_quotes/screen/controller/quo_controller.dart';
import 'package:db_miner_quotes/utils/database_helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:sizer/sizer.dart';

class Home_Screen extends StatefulWidget {
  const Home_Screen({Key? key}) : super(key: key);

  @override
  State<Home_Screen> createState() => _Home_ScreenState();
}

class _Home_ScreenState extends State<Home_Screen> {
  QuoController controller=Get.put(QuoController());

  @override
  void initState() {
    super.initState();
    controller.getData();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      appBar: AppBar(
        title: Text('Quotes'),
        centerTitle: true,
        backgroundColor: Colors.redAccent,
        actions: [

          IconButton(onPressed: () {
            Get.toNamed('/tab');
          }, icon: Icon(Icons.add))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Container(
                margin: EdgeInsets.all(10),
                alignment: Alignment.centerLeft,
                child: Text("Most Popular",
                    style: TextStyle(
                        fontSize: 13.sp, fontWeight: FontWeight.bold))),
            Obx(
              () =>  Expanded(
                child: GridView.builder(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,mainAxisExtent: 150,mainAxisSpacing: 20,crossAxisSpacing: 30), itemBuilder: (context, index) {
                  return GestureDetector(

                    onTap: () {
                      Get.toNamed('/read',arguments: controller.catList[index]['cat']);
                    },
                    onLongPress: () {
                      DbHelper.dbHelper.deleteCat(controller.catList[index]['id']);
                    },
                    onDoubleTap: () {
                      Get.toNamed('/tab');
                    },
                    child: Container(
                      height: 10.h,
                      decoration: BoxDecoration(
                        color: Colors.redAccent,
                        borderRadius: BorderRadius.circular(15.sp),
                      ),
                      child: Center(child: Text("${controller.catList[index]['cat']}",style: TextStyle(fontSize: 15.sp,color: Colors.white),)),
                    ),
                  );
                },itemCount: controller.catList.length,),
              ),
            )
          ],
        ),
      ),
    ));
  }
}
