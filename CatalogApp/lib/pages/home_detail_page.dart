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
              "Sadipscing justo tempor elitr dolor sea ipsum, est consetetur tempor elitr dolor, amet elitr diam rebum et sit vero eos elitr, sed stet consetetur gubergren sea voluptua stet ea stet, diam stet stet dolore sed clita vero at no at. Labore at dolor erat sed invidunt consetetur amet et voluptua."
              .text
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