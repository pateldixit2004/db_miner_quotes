import 'package:db_miner_quotes/screen/view/add_catogory.dart';
import 'package:db_miner_quotes/screen/view/add_quotes.dart';
import 'package:db_miner_quotes/screen/view/add_screen.dart';
import 'package:db_miner_quotes/screen/view/home_screen.dart';
import 'package:db_miner_quotes/screen/view/read-screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
void main()
{
  runApp(
    Sizer(builder: (context, orientation, deviceType) =>  GetMaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          '/':(p0) => HomeScreen(),
          '/add':(p0) => AddScreen(),
          '/cat':(p0) => CatogoryScreen(),
          '/quo':(p0) => Quotes(),
          '/read':(p0) => ReadScreen(),
        },
      ),
    )
  );
}