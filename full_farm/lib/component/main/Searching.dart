import 'package:flutter/material.dart';

class Searching extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(child: Text('123'));
  }
}

Widget _searchIconButton = IconButton(
  iconSize: 30,
  icon: const Icon(Icons.search),
  color: Colors.lightGreen,
  onPressed: () => {print('search')},
);


class SearchingInput extends StatelessWidget {
  final myController = TextEditingController();
  final hintStyle = TextStyle(
    fontSize: 20,
  );

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: myController,
      textAlign: TextAlign.center,
      decoration: InputDecoration(
        hintText: "원하는 상품을 이곳에 검색하세요!",
        suffixIcon: _searchIconButton,
        hintStyle: hintStyle,
      ),
    );
  }



  // Mycontroller 사용해서 검색기능 구현 필요
}

