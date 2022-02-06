import 'package:flutterpractice/ItemsData/cart_items.dart';
import 'package:flutterpractice/ItemsData/items_data.dart';
import 'package:velocity_x/velocity_x.dart';

class MyStore extends VxStore {
  late ProductsInfo catalog;
  late CartInfo cart;

  MyStore() {
    catalog = ProductsInfo();
    cart = CartInfo();
    cart.catalog = catalog;
  }
}
