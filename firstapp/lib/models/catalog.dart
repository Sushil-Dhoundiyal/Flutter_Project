class CatalogModel{
  static final items = [
    Item(
      id: 1,
      name: "poco M3",
      desc: "Miui 12th generation",
      price: 999,
      color: "#33505a",
      image: "https://s3b.cashify.in/gpro/uploads/2021/04/04195639/Poco-M3-1.jpg"
    )
  ];
}

class Item{
  final int id;
  final String name;
  final String desc;
  final num price;
  final String color;
  final String image;

  Item({required this.id, required this.name, required this.desc, required this.price, required this.color, required this.image});
}