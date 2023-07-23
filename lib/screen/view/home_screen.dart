import 'package:db_miner_quotes/screen/controller/quotes_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  QuotesController controller = Get.put(QuotesController());

  @override
  void initState() {
    super.initState();
    controller.GetCatogoryData();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            title: Text("Quotes "),
            centerTitle: true,
            actions: [
              IconButton(
                  onPressed: () {
                    Get.toNamed("/cat");
                  },
                  icon: Icon(Icons.add_circle_outline)),
            ],
          ),
          // body: Obx(
          //   () => GridView.builder(
          //     gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          //         crossAxisCount: 2, mainAxisExtent: 100),
          //     itemBuilder: (context, index) {
          //       return GestureDetector(
          //         onTap: () {
          //           Get.toNamed('/read',
          //               arguments: controller.catList[index]['categery']);
          //         },
          //         child: Container(
          //           height: 150,
          //           margin: EdgeInsets.all(2.sp),
          //           decoration: BoxDecoration(
          //             borderRadius: BorderRadius.circular(13.sp),
          //             color: Colors.redAccent,
          //           ),
          //           child: Text(
          //             "${controller.catList[index]['categery']}",
          //             style: TextStyle(
          //                 fontSize: 14.sp,
          //                 color: Colors.white,
          //                 fontWeight: FontWeight.bold),
          //           ),
          //         ),
          //       );
          //     },
          //     itemCount: controller.catList.length,
          //   ),
          // ),
          body: Obx(
            () => GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, mainAxisExtent: 100),
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    Get.toNamed('/read',
                        arguments: controller.catList[index]['cat']);
                  },
                  child: Container(
                    height: 150,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.redAccent,
                    ),
                    child: Center(
                        child:
                            Text("${controller.catList[index]['cat']}")),
                  ),
                );
                // return Column(
                //   children: [
                //     ListTile(
                //       leading: Text(
                //           "${controller.dataquotesList[index]['categery']}"),
                //     ),
                //     Container(
                //       child: Text(
                //           "${controller.dataquotesList[index]['qutoes']}"),
                //     )
                //   ],
                // );
              },
              itemCount: controller.catList.length,
            ),
          )),
    );
  }
}
