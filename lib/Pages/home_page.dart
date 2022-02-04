// ignore_for_file: unnecessary_null_comparison

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutterpractice/ItemsData/items_data.dart';
import 'package:velocity_x/velocity_x.dart';

import '../widgets/HomePageWidget/make_header.dart';
import '../widgets/HomePageWidget/build_the_list.dart';

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
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const MakeHeader(),
            (ProductsInfo.products.isEmpty || ProductsInfo.products == null)
                ? const CircularProgressIndicator().centered().expand()
                : const BuildTheList()
          ],
        ).p(4),
      ),
    );
  }
}