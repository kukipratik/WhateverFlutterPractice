import 'package:velocity_x/velocity_x.dart';
import '../core/store.dart';
import 'items_data.dart';

class CartInfo {
  // field catalog...
  late ProductsInfo catalog;

  // making list to store the id when user presses the "add to cart button"...
  final List<int> _listOfIds = [];

  // Making list of products which has been added to cart using listOfIds...
  List<Product> get addedProductsList {
    return _listOfIds.map((id) => ProductsInfo.getById(id)).toList();
  }

  //getter for displaying the total price of products in the cart...
  num get totalPrice => addedProductsList.fold(
      0, (previousValue, element) => (previousValue + element.price!));
}

// Class to add Product id in listOfIds...
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

//Class to remove Product id from listOfIds...
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
