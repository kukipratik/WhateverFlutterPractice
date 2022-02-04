import 'package:flutter/material.dart';
import 'package:flutterpractice/ItemsData/items_data.dart';
import 'package:velocity_x/velocity_x.dart';

class ProductDetail extends StatelessWidget {
  final Product? item;
  const ProductDetail({Key? key, @required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(230, 230, 230, 1),
      appBar: AppBar(
        elevation: 0,
        title: "Product".text.bold.black.center.make()
      ),
      body: Column(
        children: [
          VxArc(
            height: 30,
            child: Container(
              color: Colors.white,
              child: Hero(
                tag: Key(item!.id.toString()),
                child: Image.network(item!.image.toString()).centered().py16().h40(context)),
            ),
          )
        ],
      ),
    );
  }
}
