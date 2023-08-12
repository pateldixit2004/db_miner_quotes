import 'package:db_miner_quotes/screen/view/add_category.dart';
import 'package:db_miner_quotes/screen/view/add_quotes.dart';
import 'package:flutter/material.dart';

class TabScreen extends StatefulWidget {
  const TabScreen({Key? key}) : super(key: key);

  @override
  State<TabScreen> createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.redAccent,
          bottom: TabBar(
            labelColor: Colors.white,
            tabs: [
              Tab(child: Text('Add category'),),
              Tab(child: Text('Add Quotes'),),
            ],
          ),

        ),
        body: TabBarView(children: [
          AddCatScreen(),
          AddQuoScreen(),
        ]),
      ),
    ));
  }
}
