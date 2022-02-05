import 'items_data.dart';

class CartInfo {
  // making list to store the id when user presses the "add to cart button"...
  final List<int> listOfIds = [];
  static var a = Product().color;

  // function to add Product id in listOfIds...
  void addIdToCart(int id) {
    listOfIds.add(id);
  }

  //function to remove Product id from listOfIds...
  void removeIdFromCart(int id) {
    listOfIds.remove(id);
  }

  // Making list of products which has been added to cart using listOfIds...
  List<Product> get addedProductsList {
    return listOfIds.map((id) => ProductsInfo.getById(id)).toList();
  }
}
