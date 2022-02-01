import 'package:clay_containers/clay_containers.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return (Scaffold(
      appBar: AppBar(
        title: const Text("Hello"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ClayContainer(
              color: Colors.white,
              depth: 60,
              emboss: false,
              child: ClayText(
                "Welcome to HomePage",
                size: 50,
              ),
            )
          ],
        ),
      ),
    ));
  }
}
