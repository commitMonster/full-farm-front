import 'package:flutter/material.dart';

class Footer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var deviceMediaQueryData = MediaQuery.of(context).size.width;
    return Container(
      height: 60,
      color: Colors.brown,
      child: Row(
        children: [
          FooterMenuList(width: deviceMediaQueryData),
        ],
      ),
    );
  }
}


Widget _footerMenu(name) {
  return Container(
      child: TextButton(
    onPressed: () => {print('Text Pressed')},
    child: Text(
      name,
      style: TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.bold,
      ),
    ),
  ));
}


Widget FooterMenuList({width}) {
  return (Container(
      width: width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _footerMenu('팀소개'),
          _footerMenu('이용약관'),
          _footerMenu('개인정보처리방침'),
          Container(
            width:width*0.15
          ),
          commitMonster,
          location,
        ],
      )));
}



// Widget FooterMenuOthers()



final footerColumnTextStyle = TextStyle(
    color:Colors.white,
    fontSize:14,
);

Column commitMonster = Column(
  crossAxisAlignment: CrossAxisAlignment.start,
  mainAxisAlignment: MainAxisAlignment.center,
  children: [
    Text('(주)commit Monster',
  style:footerColumnTextStyle,),
    Text('©Commit monster All Rights reserved.',
  style:footerColumnTextStyle ),
  ],
);

Text location = Text('소재지 : 서울특별시 노원구 공릉로 232 미래관 313호',
style: footerColumnTextStyle,);