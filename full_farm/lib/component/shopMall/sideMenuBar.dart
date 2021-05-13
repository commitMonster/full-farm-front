import 'package:flutter/material.dart';

class SideMenuBar extends StatelessWidget {


  @override
  Widget build(BuildContext context) {

    return Container(
        child:ListView(
        padding: EdgeInsets.only(top:100),
        children: <Widget>[
          ListTile(
            leading: Icon(Icons.input),
            title: Text('Welcome'),
            onTap: () => {},
          ),
          ListTile(
            leading: Icon(Icons.verified_user),
            title: Text('Profile'),
            // onTap: () => {Navigator.of(context).pop()},
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('Settings'),
            onTap: () => {Navigator.of(context).pop()},
          ),
          ListTile(
            leading: Icon(Icons.border_color),
            title: Text('Feedback'),
            // onTap: () => {Navigator.of(context).pop()},
          ),
          ListTile(
            leading: Icon(Icons.exit_to_app),
            title: Text('Logout'),
            onTap: () => {print('categories')},
          )
    //  ,ListTile(
          //   leading: Icon(Icons.exit_to_app),
          //   title: Text('Logout'),
          //   onTap: () => {print('categories')},
          // ),ListTile(
          //   leading: Icon(Icons.exit_to_app),
          //   title: Text('Logout'),
          //   onTap: () => {print('categories')},
          // ),ListTile(
          //   leading: Icon(Icons.exit_to_app),
          //   title: Text('Logout'),
          //   onTap: () => {print('categories')},
          // ),
        ],
    ),
    );
  }
}