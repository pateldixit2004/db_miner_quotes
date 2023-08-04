import 'package:db_miner_quotes/screen/view/home_screen.dart';
import 'package:db_miner_quotes/screen/view/read_screen.dart';
import 'package:db_miner_quotes/screen/view/tab_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
void main()
{
  runApp(
    Sizer(builder: (context, orientation, deviceType) =>  GetMaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          '/':(p0) => Home_Screen(),
          '/tab':(p0) => TabScreen(),
          '/read':(p0) => ReadScreen(),
        },
      ),
    )
  );
}