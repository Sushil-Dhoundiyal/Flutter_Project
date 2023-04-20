import 'package:firstapp/widgets/themes.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class CatalogHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        "Catalog App"
            .text
            .xl5
            .bold
            .color(context.theme.accentColor)
            .make(), //"Catalog App".text.make() == Text("Catalog App",....)
        "Trending products".text.xl2.make(),
      ],
    );
  }
}