// ignore_for_file: unnecessary_null_comparison

import 'dart:convert';
import 'package:clay_containers/clay_containers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutterpractice/ItemsData/items_data.dart';
import 'package:flutterpractice/widgets/my_drawer.dart';
import 'package:flutterpractice/widgets/my_item_widget.dart';
import 'package:velocity_x/velocity_x.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // this init method is provided by statefullwidget.. so that we could do some process before calling Widget build function...
  @override
  void initState() {
    super.initState();
    loadJsonData();
  }

// This function is to decode the json file...
  loadJsonData() async {
    // this await is to wait 2sec before loading data completely...
    await Future.delayed(const Duration(seconds: 2));
    // Here decoding works exactly like unwraping the folded paper...(Tip:-compare with original json file)
    // catlogJson will get the raw data form json...
    final catalogJson = await rootBundle.loadString("assets/files/catlog.json");
    // This decodedData will get the map from CatalogJson...
    final decodedData = jsonDecode(catalogJson);
    // This productsData will get the list of the products from decodedData(map)....
    var productsData = decodedData["products"];
    // This list will also get the list as ['id','name',]....
    List<Product> list = List.from(productsData)
        .map<Product>((item) => Product.fromMap(item))
        .toList();
    // Assigning value to ProductsInfo.products....(not necessary though)
    ProductsInfo.products = list;
    //setState is to call the build widget...
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Vx.hexToColor("#f5f5f5"),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const MakeHeader(),
            ListView.builder(
              itemCount: ProductsInfo.products.length,
              itemBuilder: (context, index) {
                var item = ProductsInfo.products[index];
                return Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ClayContainer(
                          emboss: false,
                          height: 100,
                          width: 90,
                          depth: 20,
                          child: Image.network(item.image.toString())),
                      ClayContainer(
                        emboss: false,
                        height: 100,
                        width: 255,
                        depth: 20,
                        borderRadius: 15,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            item.name.toString().text.normal.xl2.make(),
                            item.desc.toString().text.black.make(),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                "\$${item.price.toString()}"
                                    .text
                                    .normal
                                    .xl2
                                    .make(),
                                ElevatedButton(
                                  onPressed: () {},
                                  child: "Buy".text.make(),
                                )
                              ],
                            )
                          ],
                        ).pOnly(left: 10, top: 2, right: 8),
                      ),
                    ],
                  ),
                );
              },
            ).expand(),
          ],
        ).p(4),
      ),
    );
  }
}

class MakeHeader extends StatelessWidget {
  const MakeHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClayText(
          "PodCast App",
          depth: 100,
          size: 60,
          color: Colors.grey,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        // const HeightBox(2),
        "Trending Products".text.xl2.blueGray900.shadowBlur(50).make()
      ],
    ).p(15);
  }
}
