import 'package:firstapp/core/store.dart';
import 'package:firstapp/models/cart.dart';
import 'package:firstapp/models/catalog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class AddToCart extends StatelessWidget {
  final Item catalog;
  AddToCart({
    super.key, required this.catalog,    //  *********************
  });


  @override
  Widget build(BuildContext context) {
    VxState.watch(context, on: [AddMutation]);

    final CartModel _cart = (VxState.store as MyStore).cart;
    bool isInCart = _cart.items.contains(catalog) ?? false;
    return ElevatedButton(
      onPressed: () {
        if(!isInCart){
          AddMutation(catalog);
        // setState(() {});
        }
      },
      style: ButtonStyle(
          backgroundColor:
              MaterialStateProperty.all(context.theme.buttonColor),
          shape: MaterialStateProperty.all(StadiumBorder(),)),
      child: isInCart ? Icon(Icons.done) : Icon(CupertinoIcons.cart_badge_plus),
    );
  }
}