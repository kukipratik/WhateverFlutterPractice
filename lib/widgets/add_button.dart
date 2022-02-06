import 'package:flutter/material.dart';
import 'package:flutterpractice/ItemsData/cart_items.dart';
import 'package:flutterpractice/ItemsData/items_data.dart';
import 'package:velocity_x/velocity_x.dart';

import '../core/store.dart';

class AddingButton extends StatelessWidget {
  final Product? product;

  const AddingButton({Key? key, @required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {

  // this will rebuild the widget when ever AddMutation is executed...
    VxState.watch(context, on: [AddMutation]);

    // This expression helps us to use the instance created in store...
    final CartInfo _cart = (VxState.store as MyStore).cart;
  //this expression will let us know if product is already in cart list or not...
  //made this expression getter sothat there won't be any problem while initializing widget to it....
  bool productAdded =
      (_cart.addedProductsList.contains(product)) ? true : false;
    return ElevatedButton(
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(context.primaryColor),
          shape: MaterialStateProperty.all(const StadiumBorder())),
      onPressed: () {
        if (!productAdded) {
          AddMutation(product!);
          debugPrint("No. of item in cart = " +
              CartInfo().addedProductsList.length.toString());
        }
      },
      child:
          productAdded ? const Icon(Icons.done) : "+ Add to cart".text.make(),
    );
  }
}
