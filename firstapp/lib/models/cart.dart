import 'package:firstapp/models/catalog.dart';
class CartModel{

  static final cartModel = CartModel._internal();

  CartModel._internal();

  factory CartModel() => cartModel;

// CATALOG FIELD
late CatalogModel _catalog;        //    ***********************late

// COLLECTION OF IDS - STORE IDS OF EACH ITEM
final List<int> _itemIds = [];

// GET CATALOG
CatalogModel get catalog => _catalog;

set catalog(CatalogModel newCatalog){
  assert(newCatalog != null);
  _catalog = newCatalog;
}

// GET ITEM IN THE CART
List<Item> get items => _itemIds.map((id) => _catalog.getById(id)).toList();

//GET TOTAL PRICE
num get totalPrice => items.fold(0, (total, current) => total + current.price);

// ADD ITEM
void add(Item item){
  _itemIds.add(item.id);
}

// REMOVE ITEM
void remove(Item item){
  _itemIds.remove(item.id);
}


}