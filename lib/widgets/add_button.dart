import 'package:flutter/material.dart';
import 'package:flutterpractice/ItemsData/cart_items.dart';
import 'package:velocity_x/velocity_x.dart';

class AddingButton extends StatefulWidget {
  final int? id;

  const AddingButton({Key? key, @required this.id}) : super(key: key);

  @override
  State<AddingButton> createState() => _AddingButtonState();
}

class _AddingButtonState extends State<AddingButton> {
  bool productAdded = false;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(context.primaryColor),
          shape: MaterialStateProperty.all(const StadiumBorder())),
      onPressed: () {
        CartInfo().addIdToCart(widget.id!);
        debugPrint(productAdded.toString());
        setState(() {
          productAdded = !productAdded;
        });
      },
      child: productAdded
          ? const Icon(Icons.done)
          : "+ Add to cart".text.make(),
    );
  }
}
