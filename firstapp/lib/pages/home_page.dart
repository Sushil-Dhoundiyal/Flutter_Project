import 'package:flutter/material.dart';

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
          child: Text('Welcome to 30 days of flutter')
          )
          ),
          drawer: Drawer(),
      );
  }
}