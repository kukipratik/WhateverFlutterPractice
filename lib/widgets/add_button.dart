import 'package:flutter/material.dart';
import 'package:flutterpractice/ItemsData/cart_items.dart';
import 'package:flutterpractice/ItemsData/items_data.dart';
import 'package:velocity_x/velocity_x.dart';

class AddingButton extends StatefulWidget {
  final Product? product;

  const AddingButton({Key? key, @required this.product}) : super(key: key);

  @override
  State<AddingButton> createState() => _AddingButtonState();
}

class _AddingButtonState extends State<AddingButton> {
  //this expression will let us know if product is already in cart list or not...
  //made this expression getter sothat there won't be any problem while initializing widget to it....
  bool get productAdded =>
      (CartInfo().addedProductsList.contains(widget.product)) ? true : false;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(context.primaryColor),
          shape: MaterialStateProperty.all(const StadiumBorder())),
      onPressed: () {
        if (!productAdded) {
          CartInfo().addIdToCart(widget.product!.id!.toInt());
          debugPrint("bool value = " + productAdded.toString());
          debugPrint("No. of item in cart = " +
              CartInfo().addedProductsList.length.toString());
          setState(() {});
        }
      },
      child:
          productAdded ? const Icon(Icons.done) : "+ Add to cart".text.make(),
    );
  }
}
