// this class contains the listView.builder
import 'package:clay_containers/widgets/clay_container.dart';
import 'package:flutter/material.dart';
import 'package:flutterpractice/Pages/product_detail.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../ItemsData/items_data.dart';
import '../../Pages/cart_page.dart';

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
class MakeListItem extends StatelessWidget {
  final Product? item; //here '?' is to check for null value
  const MakeListItem({Key? key, @required this.item})
      : assert(item != null),
        super(key: key);

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
                        item: item,
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
                  tag: Key(item!.id.toString()),
                  child: Image.network(item!.image.toString()),
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
                  item!.name.toString().text.normal.xl2.make(),
                  item!.desc.toString().text.make(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      "\$${item!.price.toString()}".text.normal.xl2.make(),
                      ElevatedButton(
                        style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(context.primaryColor),
                            shape: MaterialStateProperty.all(
                                const StadiumBorder())),
                        onPressed: () {},
                        child: "+ Add to cart".text.make(),
                      )
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
