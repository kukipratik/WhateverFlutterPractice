// This class will help us to make header...
import 'package:clay_containers/clay_containers.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

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