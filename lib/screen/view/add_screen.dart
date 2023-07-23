import 'package:db_miner_quotes/screen/view/add_catogory.dart';
import 'package:db_miner_quotes/screen/view/add_quotes.dart';
import 'package:flutter/material.dart';

class AddScreen extends StatefulWidget {
  const AddScreen({Key? key}) : super(key: key);

  @override
  State<AddScreen> createState() => _AddScreenState();
}

class _AddScreenState extends State<AddScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          bottom: TabBar(
            tabs: [
              Tab(
                child: Text("Add Category"),
              ),
              Tab(
                child: Text("Add quotes"),
              )
            ],
          ),

        ),
        body: TabBarView(
          children: [
            CatogoryScreen(),
            Quotes(),
          ],
        ),
      ),
    ),);
  }
}
