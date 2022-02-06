import 'package:clay_containers/widgets/clay_text.dart';
import 'package:flutter/material.dart';
import 'package:flutterpractice/ItemsData/cart_items.dart';
import 'package:flutterpractice/ItemsData/items_data.dart';
import 'package:flutterpractice/core/store.dart';
import 'package:velocity_x/velocity_x.dart';

class Cart extends StatelessWidget {
  const Cart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
        // making list of item that has been added...
        VxArc(
          height: 30,
          child: Container(
            color: Colors.white,
            child: const MakeCartList(),
          ),
        ).expand(),

        // Row to display buy button and total price...
        const MakeRow().px(45).py(55).pOnly(top: 55)
      ]),
    );
  }
}

// Row for making Button and to display total price...
class MakeRow extends StatelessWidget {
  const MakeRow({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //This experssion helps us to acess the same instance created in the store...
    final CartInfo cart = (VxState.store as MyStore).cart;

    // simply making new list to use efficiently...
    // List<Product> newList = cart.addedProductsList;
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      // This works same as Vx.watch() but will only rebuild the widget inside it....
      VxConsumer(
        mutations: const {RemoveMutation},
        notifications: const {},
        builder: (context, _, status) {
          //for displaying total price...
          return "\$${cart.totalPrice}".text.underline.extraBold.xl3.make();
        },
      ),

      // for buy button...
      ElevatedButton(
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(context.primaryColor),
            shape: MaterialStateProperty.all(const StadiumBorder())),
        onPressed: () {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: "Buying not supported yet.".text.make(),
            duration: const Duration(seconds: 1),
          ));
        },
        child: "Buy".text.xl2.make(),
      ).w20(context)
    ]);
  }
}

//Class for making item list in cart....
class MakeCartList extends StatelessWidget {
  const MakeCartList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //this will rebuild the widgets if we acess "RemoveMutation" function below...
    VxState.watch(context, on: [RemoveMutation]);

    //This experssion helps us to acess the same instance created in the store...
    final CartInfo cart = (VxState.store as MyStore).cart;

    // simply making new list to use efficiently...
    List<Product> newList = cart.addedProductsList;
    return (newList.isEmpty)
        ? "It's Empty...".text.bold.xl6.makeCentered()
        : ListView.builder(
            itemCount: newList.length,
            itemBuilder: (context, index) {
              return ListTile(
                leading: const Icon(
                  Icons.donut_small_rounded,
                  color: Colors.black,
                ),
                title:
                    newList[index].name.toString().text.bold.black.xl2.make(),
                subtitle: newList[index].desc.toString().text.black.make(),
                trailing: IconButton(
                    onPressed: () {
                      RemoveMutation(newList[index]);
                    },
                    icon: const Icon(
                      Icons.remove_circle,
                      color: Colors.black,
                    )),
              );
            });
  }
}
