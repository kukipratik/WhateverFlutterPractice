import 'package:flutter/material.dart';
import 'package:flutterpractice/ItemsData/items_data.dart';
import 'package:flutterpractice/widgets/my_drawer.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

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
            return (ListTile(
              leading: Image.network(item.img),
              title: Text(item.name),
              subtitle: Text(item.description),
              trailing: Text(item.price),
            ));
          },
        )));
  }
}
