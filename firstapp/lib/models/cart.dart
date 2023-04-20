import 'package:firstapp/core/store.dart';
import 'package:firstapp/models/catalog.dart';
import 'package:velocity_x/velocity_x.dart';
class CartModel{

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


// REMOVE ITEM
void remove(Item item){
  _itemIds.remove(item.id);
}


}


class AddMutation extends VxMutation<MyStore>{
  final Item item;

  AddMutation(this.item);
  @override
  perform() {
    store!.cart._itemIds.add(item.id);        //   !  **************************
  }
  
}