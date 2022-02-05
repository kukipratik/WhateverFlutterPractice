import 'items_data.dart';

class CartInfo {
  // making list to store the id when user presses the "add to cart button"...
  static List<int> listOfIds = [] ;

  // function to add Product id in listOfIds...
  static void addIdToCart(int id) {
    listOfIds.add(id);
  }
  
  //function to remove Product id from listOfIds...
  static void removeIdFromCart(int id){
    listOfIds.remove(id);
  }

  // Making list of products which has been added to cart using listOfIds...
  List<Product> addedProductsList = listOfIds.map((id) => ProductsInfo.getById(id)).toList(); 
}
