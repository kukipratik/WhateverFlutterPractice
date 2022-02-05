import 'items_data.dart';

class CartInfo {
  // making list to store the id when user presses the "add to cart button"...
  static final List<int> _listOfIds = [];

  // function to add Product id in listOfIds...
  void addIdToCart(int id) {
    _listOfIds.add(id);
  }

  //function to remove Product id from listOfIds...
  void removeIdFromCart(int id) {
    _listOfIds.remove(id);
  }

  // Making list of products which has been added to cart using listOfIds...
  List<Product> get addedProductsList {
    return _listOfIds.map((id) => ProductsInfo.getById(id)).toList();
  }
}
