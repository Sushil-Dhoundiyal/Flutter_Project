import 'package:CatalogApp/models/catalog.dart';
import 'package:CatalogApp/widgets/Home_Widgets/add_to_cart.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class HomeDetailPage extends StatelessWidget {
  final Item catalog;

  const HomeDetailPage({Key? key, required this.catalog})
      : assert(catalog != null),
        super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.transparent),
      backgroundColor: context.canvasColor,
      bottomNavigationBar: Container(
        color: context.cardColor,
        child: ButtonBar(
                  alignment: MainAxisAlignment.spaceBetween,
                  buttonPadding: EdgeInsets.zero,
                  children: [
                    "\$${catalog.price}".text.bold.xl4.red700.make(),
                    AddToCart(catalog: catalog)
                    .wh(120, 50)
                  ],
                ).p32(),
      ),
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            Hero(
                tag: Key(catalog.id.toString()),
                child: Image.network(catalog.image)
            ).h32(context),
            Expanded(
              child: VxArc(
                height: 26.0,
                arcType: VxArcType.CONVEY,
                edge: VxEdge.TOP,
                child: Container(
                  color: context.cardColor,
                  width: context.screenWidth,
                  child: Column(
                    children: [
                      catalog.name.text.xl4.color(context.accentColor).bold.make(),
              catalog.desc.text.textStyle(context.captionStyle).xl.make(),
              10.heightBox,
              "Key Features Memory: 8 GB RAM and 128 GB internal memory Dimensions: 161.4 mmx75.6 mmx7.8 mm Color options: Phantom Black Battery Capacity: 4800 mAh Lithium-ion battery Warranty information: 1 Year Manufacturer Warranty is provided by the manufacturer from the date of purchase".text
              .textStyle(context.captionStyle)
              .make().p16()
                    ],
                  ).py64(),
                ),
              )
            )
          ],
        ),
      ),
    );
  }
}
