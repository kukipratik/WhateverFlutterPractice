// ignore_for_file: unnecessary_null_comparison

import 'package:clay_containers/widgets/clay_container.dart';
import 'package:flutter/material.dart';
import 'package:flutterpractice/ItemsData/items_data.dart';

class ItemWidget extends StatelessWidget {
//this class returns the items to be build....
  const ItemWidget({
    Key? key,
    required this.item,
  })  : assert(item != null),
        super(key: key);

  final Product item;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(14),
      child: ClayContainer(
        emboss: false,
        color: Colors.white,
        depth: 50,
        child: GridTile(
          child: Image.network(item.image.toString()),
          header: Text(item.name.toString()),
          footer: Text(item.price.toString()),
        ),
      ),
    );
  }
}
