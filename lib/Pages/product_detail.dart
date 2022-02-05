import 'package:clay_containers/widgets/clay_text.dart';
import 'package:flutter/material.dart';
import 'package:flutterpractice/ItemsData/items_data.dart';
import 'package:flutterpractice/widgets/add_button.dart';
import 'package:velocity_x/velocity_x.dart';

class ProductDetail extends StatelessWidget {
  final Product? item;
  const ProductDetail({Key? key, @required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.backgroundColor,
      appBar: AppBar(
        // backgroundColor: Colors.white,
        elevation: 0,
        title: ClayText(
          "PodCast",
          depth: 100,
          size: 60,
          color: Colors.grey,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: Column(
        children: [
          VxArc(
            //this VxArc is provided by VelocityX for making arc like stuff...
            height: 30,
            child: Container(
              color: Colors.white,
              child: Hero(
                  tag: Key(item!.id.toString()),
                  child: Image.network(item!.image.toString())
                      .centered()
                      .py16()
                      .h40(context)),
            ),
          ),
          item!.name.toString().toUpperCase().text.bold.xl4.make().py(10),
          item!.desc.toString().text.xl.make(),
        ],
      ),
      bottomNavigationBar: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          "\$${item!.price.toString()}".text.underline.extraBold.xl3.make(),
          AddingButton(id: item!.id ).wh(150, 40).py12()
        ],
      ).p24(),
    );
  }
}
