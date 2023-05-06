import 'package:CatalogApp/core/store.dart';
import 'package:CatalogApp/models/catalog.dart';
import 'package:velocity_x/velocity_x.dart';
class CartModel{

// CATALOG FIELD
late CatalogModel _catalog;        

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



}


class AddMutation extends VxMutation<MyStore>{
  final Item item;

  AddMutation(this.item);
  @override
  perform() {
    store!.cart._itemIds.add(item.id);        
  }
  
}


class RemoveMutation extends VxMutation<MyStore>{
  final Item item;

  RemoveMutation(this.item);
  @override
  perform() {
    store!.cart._itemIds.remove(item.id);        
  }
  
}