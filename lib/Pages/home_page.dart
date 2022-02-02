import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutterpractice/ItemsData/items_data.dart';
import 'package:flutterpractice/widgets/my_drawer.dart';

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

  loadJsonData() {
    final catlogJson =
        rootBundle.loadString("assets/files/catlog.json").toString();
    final decodedData = jsonDecode(catlogJson);
    var productsData = decodedData["products"];
    List<Product> list = List.from(productsData)
        .map<Product>((item) => Product.formMap(item))
        .toList();
    ProductsInfo.products = list;
  }

  @override
  Widget build(BuildContext context) {
    var items = ProductsInfo.products;

    return (Scaffold(
        appBar: AppBar(
          title: const Text("HomePage!!!"),
        ),
        drawer: const MyDrawer(),
        body: ListView.builder(
          // we're giving listcount how many items we have in a list...
          itemCount: items.length,
          // item builder helps us to build list...
          itemBuilder: (context, index) {
            final Product item = items[index];
            return (ItemWidget(item: item));
          },
        )));
  }
}

class ItemWidget extends StatelessWidget {
//this class returns the items to be build....
  const ItemWidget({
    Key? key,
    required this.item,
  }) : super(key: key);

  final Product item;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Card(
        child: ListTile(
          leading: Image.network(item.image),
          title: Text(item.name),
          subtitle: Text(item.desc),
          trailing: Text(item.price),
        ),
      ),
    );
  }
}
