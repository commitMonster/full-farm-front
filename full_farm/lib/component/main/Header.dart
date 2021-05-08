import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var deviceMediaQueryData = MediaQuery.of(context).size.width - 100;
    return Container(
      height: 80,
      // width: 200,
      // margin: const EdgeInsets.only(left:20.0,top:0.0,right:20.0),
      color: Colors.white,
      child: Row(
        children: [
          fullFarmIcon,
          headerMenuList(width: deviceMediaQueryData),
        ],
      ),
    );
  }
}
// Widget fullFarmIcon =
// ClipOval( child: IconButton(
//   iconSize: 80,
//   icon : ImageIcon(
//     AssetImage("image/full-farm-logo.png"),
//     color: Colors.green,
//   ),
//   onPressed: () => { print('icon Pressed') },
// )
// );

Widget fullFarmIcon = Container(
  width: 60,
  height: 60,
  margin: EdgeInsets.only(left: 40),
  decoration: BoxDecoration(
    image: DecorationImage(image: AssetImage('image/full-farm-logo.png')),
  ),
  //BoxDecoration
  child: FlatButton(
    padding: EdgeInsets.all(0.0),
    onPressed: () => {print('button Clicked')},
    child: Container(),
  ),
);


Widget _headerMenu(name) {
  return Container(
      child: TextButton(
    onPressed: () => {print('Text Pressed')},
    child: Text(
      name,
      style: TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.bold,
      ),
    ),
  ));
}

Widget headerMenuList({width}) {
  return (Container(
      width: width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _headerMenu('식물농장'),
          _headerMenu('공지 / 이벤트'),
          _headerMenu('마이페이지'),
          _headerMenu('장바구니 ')
        ],
      )));
}
