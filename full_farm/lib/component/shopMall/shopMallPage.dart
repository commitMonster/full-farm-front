import 'package:flutter/material.dart';
import 'package:full_farm/component/main/Footer.dart';
import 'package:full_farm/component/main/Header.dart';

class ShopMall extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'hello flutter',
        home: Scaffold(
          body: ListView(children: [
            Header(),
            Footer(),
          ]),
        ));
  }
}

void main() {
  runApp(ShopMall());
}
