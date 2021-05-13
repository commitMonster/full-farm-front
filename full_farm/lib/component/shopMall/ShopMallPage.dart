import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:full_farm/component/main/Footer.dart';
import 'package:full_farm/component/main/Header.dart';
import 'package:full_farm/component/shopMall/sideMenuBar.dart';
import 'package:full_farm/component/shopMall/ShopMallSearching.dart';

class ShopMall extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // var deviceMediaQueryData = MediaQuery.of(context).size.height;
    return MaterialApp(
        title: '풀팜',
        home: Scaffold(
            body: Container(
                height: 10000,
                child: Column(children: [
                  Header(),
                  Expanded(
                    child: SizedBox(
                        height: 10000,
                        child: Row(children: [
                          Flexible(flex: 1, child: SideMenuBar()),
                          Flexible(
                            flex: 3,
                            child: SearchingAndCardList(),
                          ),
                        ])),
                  ),
                  Footer(),
                ]))));
  }
}

void main() {
  runApp(ShopMall());
}
