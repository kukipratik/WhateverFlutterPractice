import 'package:clay_containers/widgets/clay_text.dart';
import 'package:flutter/material.dart';
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
        VxArc(
          height: 30,
          child: Container(
            color: Colors.white,
            child: ListView.builder(
                itemCount: 8,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: const Icon(Icons.donut_small_rounded,color: Colors.black,),
                    title: "Item".text.bold.black.xl2.make(),
                    subtitle: "Description".text.black.make(),
                    trailing: const IconButton(
                        onPressed: null, icon: Icon(Icons.remove_circle,color: Colors.black,)),
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
