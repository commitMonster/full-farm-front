import 'package:flutter/material.dart';




Widget _LatestProduct({image, text}) {
  return (Column(
    children: [
      OutlineButton(onPressed: ()=>{print('Latest Product')},
          child:
          Image.asset(
              'image/full-farm-logo.jpg'
          ),
      ),

      Text(text)
    ],
  )
  );
}

class LatestProductsList extends StatelessWidget {
  @override
  String text1 = '물품1';
  String text2 = '물품2';
  String text3 = '물품3';
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _LatestProduct(text:text1),
        _LatestProduct(text:text2),
        _LatestProduct(text:text3),
      ],

    );
  }
}
