import 'package:flutter/material.dart';

class CardLists extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 3,
      padding: EdgeInsets.all(16.0),
      // childAspectRatio: 1.0 / 10.0,
      children: [
        card,
        card,
        card,
        card,
        card,
        card,
        card,
        card,
        card,
        card,
        card,
        card,
      ],
    );
  }
}

Widget card = Card(
  clipBehavior: Clip.antiAlias,
  child: Column(
    mainAxisAlignment: MainAxisAlignment.spaceAround,
    children: [
      Image.asset('image/full-farm-logo.jpg'),
      ListTile(
        title: Text('Card title 1', style: TextStyle(fontSize: 20)),
        subtitle: Text(
          'Secondary Text',
          style: TextStyle(
            color: Colors.black.withOpacity(0.6),
            fontSize: 15,
          ),
        ),
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Flexible(
            child: TextButton(
              onPressed: () {},
              child: const Text(
                'ACTION 1',
                style: TextStyle(
                  color: Colors.blueGrey,
                ),
              ),
            ),
          ),
          Flexible(
            child: TextButton(
              onPressed: () {},
              child: const Text(
                'ACTION 2',
                style: TextStyle(
                  color: Colors.blueGrey,
                ),
              ),
            ),
          ),
        ],
      ),
    ],
  ),
);

Widget PaginationList() {
  return Container(
      child: Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      TextButton(
        onPressed: () => {print('pagination')},
        child: Text('<'),
      ),
      _paginationCount(count: '1'),
      _paginationCount(count: '2'),
      _paginationCount(count: '3'),
      TextButton(
        onPressed: () => {print('pagination')},
        child: Text('>'),
      ),
    ],
  ));
}

Widget _paginationCount({count}) {
  return TextButton(
    onPressed: () => {print('move to page')},
    child: Text(count),
  );
}
