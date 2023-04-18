import 'package:flutter/material.dart';
import 'package:firstapp/widgets/drawer.dart';

class HomePage extends StatelessWidget {
  final int days = 30;
  final String name = "Sushil";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('catalog Appee'),
      ),
        body: Center(
          child: Container(
          child: Text('Welcome to $days of flutter by $name')
          )
          ),
          drawer: MyDrawer(),
      );
  }
}