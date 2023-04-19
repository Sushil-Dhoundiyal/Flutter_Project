import 'package:firstapp/models/catalog.dart';
import 'package:firstapp/widgets/item_Widget.dart';
import 'package:flutter/material.dart';
import 'package:firstapp/widgets/drawer.dart';

class HomePage extends StatelessWidget {
  final int days = 30;
  final String name = "Sushil";

  @override
  Widget build(BuildContext context) {
    final dummyList = List.generate(15, (index) => CatalogModel.items[0]);  // 1. remove this line
    return Scaffold(
      appBar: AppBar(
        title: Text('catalog Appee'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: dummyList.length,  // 1. CatalogModel.items.length
          itemBuilder: (context, index){
            return ItemWidget(
              item: dummyList[index],   // 1. CatalogModel.items[index]
            );
          },
        ),
      ),
          drawer: MyDrawer(),
      );
  }
}