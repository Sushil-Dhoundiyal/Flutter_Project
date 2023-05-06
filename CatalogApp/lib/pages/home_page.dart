import 'package:CatalogApp/core/store.dart';
import 'package:CatalogApp/models/cart.dart';
import 'package:CatalogApp/models/catalog.dart';
import 'package:CatalogApp/utils/routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:convert';
import 'package:velocity_x/velocity_x.dart';

import '../widgets/Home_Widgets/catalog_Header.dart';
import '../widgets/Home_Widgets/catalog_List.dart';


class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final int days = 30;

  final String name = "Sushil";
  // final url = "https://jsonbin.io/app/bins/64422048c0e7653a05a8df4c";  

  @override
  void initState() {
    super.initState();
    loadData();
  }

  loadData() async {
    await Future.delayed(Duration(seconds: 1));
    final catalogJson =
        await rootBundle.loadString("assets/files/catalog.json");

    // final response = await http.get(Uri.parse(url));      // FOR FETCHING DATA FROM NETWORKING
    // final catalogJson = response.body;                 

    final decodedData = jsonDecode(catalogJson);      // FETCHING DATA FROM LOCAL JSON FILE
    var productsData = decodedData["products"];

    CatalogModel.items = List.from(productsData)
        .map<Item>((item) => Item.fromMap(item))
        .toList(); // important line
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final _cart = (VxState.store as MyStore).cart;
    return Scaffold(
        backgroundColor: context.canvasColor,
        floatingActionButton: VxBuilder(
          mutations: {AddMutation, RemoveMutation},
          builder:(context, store, status) => FloatingActionButton(
            onPressed: () => Navigator.pushNamed(context, MyRoutes.cartRoute),
            backgroundColor: context.theme.buttonColor,
            child: Icon(CupertinoIcons.cart, color: Colors.white,),
          ).badge(color: Vx.red600,size: 20, count: _cart.items.length,
          textStyle: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          )
          ),
        ),
        body: SafeArea(
          child: Container(
            padding: Vx.m32,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CatalogHeader(),
                if (CatalogModel.items != null && CatalogModel.items.isNotEmpty)
                  CatalogList().py16().expand()
                else
                    CircularProgressIndicator().centered().expand(),
              ],
            ),
          ),
        ));
  }
}