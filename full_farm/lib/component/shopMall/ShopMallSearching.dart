import 'package:flutter/material.dart';
import 'package:full_farm/component/main/SearchingInput.dart';
import 'package:full_farm/component/shopMall/CardLists.dart';

Widget SearchingAndCardList({width}) {
  return Container(
    // height: 200,
      child: Column(
        // mainAxisSize:MainAxisSize.min,
          children: [
            Container(
              height:100,
              child:Column(
                children:[
                  Flexible(child: SearchingInput(),),
                  Flexible(child: listSorting),
                  ])),
            Expanded(
              child: CardLists()
              ),
            Container(
              margin:EdgeInsets.all(30),
              child:PaginationList(),
            )
            ],
  ));
}

Widget listSorting = Row(
  mainAxisAlignment: MainAxisAlignment.center,
  children: [
    Container(
      margin: EdgeInsets.fromLTRB(10,0,10,0),
      child: TextButton(
        onPressed: () => {print('인기순 ')},
        child: Text(
          '인기순',
        ),
        style: _listSortingButtonStyle,
      ),
    ),
    Container(
      margin: EdgeInsets.fromLTRB(10,0 , 10,0),

      child: TextButton(
        onPressed: () => {print('높은가격순')},
        child: Text(
          '높은가격순',
        ),
        style: _listSortingButtonStyle,
      ),
    ),
    Container(
      margin: EdgeInsets.fromLTRB(10,0 , 10,0),
      child: TextButton(
        onPressed: () => {print('낮은가격순')},
        child: Text(
          '낮은가격순',
        ),
        style: _listSortingButtonStyle,
      ),
    ),
  ],
);

ButtonStyle _listSortingButtonStyle = TextButton.styleFrom(
    primary: Colors.blueGrey,
    padding: EdgeInsets.fromLTRB(30, 0, 30, 0),
    side: BorderSide(color: Colors.green, width: 1),
    textStyle: TextStyle(
      fontWeight: FontWeight.bold,
    )
    // backgroundColor: Colors.blueAccent,
    );
