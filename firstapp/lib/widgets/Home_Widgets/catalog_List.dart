import 'package:firstapp/pages/home_detail_page.dart';
import 'package:flutter/material.dart';
import 'package:firstapp/models/catalog.dart';
import 'package:firstapp/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';

import 'catalog_Image.dart';

class CatalogList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: CatalogModel.items.length,
      itemBuilder: (context, index) {
        final catalog = CatalogModel.getByPosition(index);
        return InkWell(
            onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => HomeDetailPage(
                      catalog: catalog,
                    )
                ),
            ),
            child: catalogItem(catalog: catalog));
      },
    );
  }
}

class catalogItem extends StatelessWidget {
  final Item catalog;

  const catalogItem({Key? key, required this.catalog})
      : assert(catalog != null),
        super(key: key);
  @override
  Widget build(BuildContext context) {
    return VxBox(
      child: Row(
        children: [
          Hero(
            tag: Key(catalog.id.toString()),
            child: CatalogImage(
              image: catalog.image,
            ),
          ),
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              catalog.name.text.lg.color(context.accentColor).bold.make(),
              catalog.desc.text.textStyle(context.captionStyle).make(),
              10.heightBox,
              ButtonBar(
                  alignment: MainAxisAlignment.spaceBetween,
                  buttonPadding: EdgeInsets.zero,
                  children: [
                    "\$${catalog.price}".text.bold.xl4.white.make(),
                    ElevatedButton(
                      onPressed: () {},
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(context.theme.buttonColor),
                          shape: MaterialStateProperty.all(StadiumBorder())),
                      child: "Add to Cart".text.make(),
                    )
                  ],
                ).pOnly(right: 8.0)
            ],
          ))
        ],
      ),
    ).color(context.cardColor).roundedLg.square(150).make().py12();
  }
}
