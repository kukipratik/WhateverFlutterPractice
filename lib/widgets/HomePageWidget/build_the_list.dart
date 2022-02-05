// this class contains the listView.builder
import 'package:clay_containers/widgets/clay_container.dart';
import 'package:flutter/material.dart';
import 'package:flutterpractice/Pages/product_detail.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../ItemsData/items_data.dart';
import '../add_button.dart';

class BuildTheList extends StatelessWidget {
  const BuildTheList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: ProductsInfo.products.length,
      itemBuilder: (context, index) {
        var item = ProductsInfo.products[index];
        return MakeListItem(item: item);
      },
    ).expand();
  }
}

// This class will make the list item and return it...
class MakeListItem extends StatefulWidget {
  final Product? item; //here '?' is to check for null value
  const MakeListItem({Key? key, @required this.item})
      : assert(item != null),
        super(key: key);

  @override
  State<MakeListItem> createState() => _MakeListItemState();
}

class _MakeListItemState extends State<MakeListItem> {

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: InkWell(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => ProductDetail(
                        item: widget.item,
                      )));
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ClayContainer(
                emboss: false,
                height: 100,
                width: 90,
                depth: 30,
                borderRadius: 25,
                color: context.backgroundColor,
                child: Hero(
                  //this hero is for simple animation...
                  tag: Key(widget.item!.id.toString()),
                  child: Image.network(widget.item!.image.toString()),
                ) //here '!' is to check for null value...
                ),
            ClayContainer(
              emboss: false,
              height: 100,
              width: 255,
              depth: 20,
              borderRadius: 20,
              color: context.backgroundColor,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  widget.item!.name.toString().text.normal.xl2.make(),
                  widget.item!.desc.toString().text.make(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      "\$${widget.item!.price.toString()}".text.normal.xl2.make(),
                       AddingButton(id : widget.item!.id)
                    ],
                  )
                ],
              ).pOnly(left: 10, top: 2, right: 8),
            ),
          ],
        ),
      ),
    );
  }
}

