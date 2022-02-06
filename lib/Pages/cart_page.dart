import 'package:clay_containers/widgets/clay_text.dart';
import 'package:flutter/material.dart';
import 'package:flutterpractice/ItemsData/cart_items.dart';
import 'package:flutterpractice/ItemsData/items_data.dart';
import 'package:velocity_x/velocity_x.dart';

class Cart extends StatefulWidget {
  const Cart({Key? key}) : super(key: key);

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  @override
  Widget build(BuildContext context) {
    List<Product> newList = CartInfo().addedProductsList;
    return Scaffold(
      backgroundColor: context.theme.backgroundColor,
      appBar: AppBar(
        elevation: 0,
        // iconTheme: IconThemeData(color: Colors.white),
        title: ClayText(
          "Your Cart.",
          depth: 100,
          size: 40,
          color: Colors.grey,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ).px(35),
      ),
      body: Column(children: [
        VxArc(
          height: 30,
          child: Container(
            color: Colors.white,
            child: ListView.builder(
                itemCount: newList.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: const Icon(
                      Icons.donut_small_rounded,
                      color: Colors.black,
                    ),
                    title: newList[index]
                        .name
                        .toString()
                        .text
                        .bold
                        .black
                        .xl2
                        .make(),
                    subtitle: newList[index].desc.toString().text.black.make(),
                    trailing: IconButton(
                        onPressed: () {
                          CartInfo().removeIdFromCart(newList[index].id!);
                          setState(() {});
                        },
                        icon: const Icon(
                          Icons.remove_circle,
                          color: Colors.black,
                        )),
                  );
                }),
          ),
        ).expand(),
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          "\$999".text.underline.extraBold.xl3.make(),
          ElevatedButton(
            style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all(context.primaryColor),
                shape: MaterialStateProperty.all(const StadiumBorder())),
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: "Buying not supported yet.".text.make(),
                duration: const Duration(seconds: 1),
              ));
            },
            child: "Buy".text.xl2.make(),
          ).w20(context)
        ]).px(45).py(55).pOnly(top: 55)
      ]),
    );
  }
}
