import 'package:flutter/material.dart';
import 'package:full_farm/component/Footer.dart';
import 'package:full_farm/component/Header.dart';
import 'package:full_farm/component/Searching.dart';
import 'package:full_farm/component/LatestProducts.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'hello flutter',
        home: Scaffold(
          body: ListView(
              children: [
                Header(),
                SearchingInput(),
                Image.asset('image/forest.jpg',
                      width: 600,
                      height:500,
                      fit: BoxFit.cover),
                LatestProductsList(),

                Footer(),


              ]),
        )
    );
  }
}

//
// Widget textSection = Container(
//   padding: const EdgeInsets.all(32),
//   child: Text(
//  '''ListView위젯에서 화면보다 커지면 스크롤 넘어가는지 테스트
//  ListView위젯에서 화면보다 커지면 스크롤 넘어가는지 테스트
//  ListView위젯에서 화면보다 커지면 스크롤 넘어가는지 테스트
//  ListView위젯에서 화면보다 커지면 스크롤 넘어가는지 테스트
//  ListView위젯에서 화면보다 커지면 스크롤 넘어가는지 테스트
//  ListView위젯에서 화면보다 커지면 스크롤 넘어가는지 테스트
//  ListView위젯에서 화면보다 커지면 스크롤 넘어가는지 테스트
//  ListView위젯에서 화면보다 커지면 스크롤 넘어가는지 테스트
//  ListView위젯에서 화면보다 커지면 스크롤 넘어가는지 테스트
//  ListView위젯에서 화면보다 커지면 스크롤 넘어가는지 테스트
//  ListView위젯에서 화면보다 커지면 스크롤 넘어가는지 테스트
//  ListView위젯에서 화면보다 커지면 스크롤 넘어가는지 테스트
//  ''',
//     softWrap: true,
//   ),
// );



void main() {
  runApp(MyApp());
}
