import 'package:flutter/material.dart';
import 'package:full_farm/component/Footer.dart';
import 'package:full_farm/component/Header.dart';


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'hello flutter',
        home: Scaffold(
          body: ListView(
              children: [

                Header(),
                Container(
                  width:80,
                  child:Center(
                      child:Text('검색창 구현 예정'),
                ),
                ),

                Image.asset('image/full-farm-logo.jpg',
                      width: 600,
                      height: 400,
                      fit: BoxFit.cover),


                footer,


                textSection,
                textSection,
                textSection,
              ]),
        )
    );
  }
}


Widget textSection = Container(
  padding: const EdgeInsets.all(32),
  child: Text(
 '''ListView위젯에서 화면보다 커지면 스크롤 넘어가는지 테스트
 ListView위젯에서 화면보다 커지면 스크롤 넘어가는지 테스트
 ListView위젯에서 화면보다 커지면 스크롤 넘어가는지 테스트
 ListView위젯에서 화면보다 커지면 스크롤 넘어가는지 테스트
 ListView위젯에서 화면보다 커지면 스크롤 넘어가는지 테스트
 ListView위젯에서 화면보다 커지면 스크롤 넘어가는지 테스트
 ListView위젯에서 화면보다 커지면 스크롤 넘어가는지 테스트
 ListView위젯에서 화면보다 커지면 스크롤 넘어가는지 테스트
 ListView위젯에서 화면보다 커지면 스크롤 넘어가는지 테스트
 ListView위젯에서 화면보다 커지면 스크롤 넘어가는지 테스트
 ListView위젯에서 화면보다 커지면 스크롤 넘어가는지 테스트
 ListView위젯에서 화면보다 커지면 스크롤 넘어가는지 테스트
 ''',
    softWrap: true,
  ),
);



void main() {
  runApp(MyApp());
}
