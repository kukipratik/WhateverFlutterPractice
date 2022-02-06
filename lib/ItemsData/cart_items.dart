import 'package:velocity_x/velocity_x.dart';

import '../core/store.dart';
import 'items_data.dart';

class CartInfo {
  // field catalog...
  late ProductsInfo catalog;

  // ProductsInfo get catalog => _catalog;

  //   set catalog(ProductsInfo newCatalog) {
  //   _catalog = newCatalog;
  // }

  // making list to store the id when user presses the "add to cart button"...
  final List<int> _listOfIds = [];

  // function to add Product id in listOfIds...
  // void addIdToCart(int id) {
  //   _listOfIds.add(id);
  // }

  //function to remove Product id from listOfIds...
  // void removeIdFromCart(int id) {
  //   _listOfIds.remove(id);
  // }

  // Making list of products which has been added to cart using listOfIds...
  List<Product> get addedProductsList {
    return _listOfIds.map((id) => ProductsInfo.getById(id)).toList();
  }
}

class AddMutation extends VxMutation<MyStore> {
//creating item field...
  final Product item;
// the constructor for the field...
  AddMutation(this.item);

  @override
  perform() {
    store!.cart._listOfIds.add(item.id!);
  }
}

class RemoveMutation extends VxMutation<MyStore> {
//creating item field...
  final Product item;
// the constructor for the field...
  RemoveMutation(this.item);

  @override
  perform() {
    store!.cart._listOfIds.remove(item.id!);
  }
}
