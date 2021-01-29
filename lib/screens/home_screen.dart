import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chatui/widgets/category_selector.dart';
import 'package:flutter_chatui/widgets/favorite_contacts.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor, //这里保持与主色一致，下面的圆角效果才能突显出来
      /* 标题栏 */
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.menu),
          iconSize: 30,
          color: Colors.white,
          onPressed: () {},
        ),
        title: Text(
          'Chats',
          style: TextStyle(
            fontSize: 28.0,
          ),
        ),
        elevation: 0.0, //无阴影
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            iconSize: 30,
            color: Colors.white,
            onPressed: () {},
          ),
        ],
      ),
      body: Column(children: <Widget>[
        CategorySelector(), //类别选择器
        Expanded(
          child: Container(
              height: 500,
              decoration: BoxDecoration(
                color: Theme.of(context).accentColor,
                borderRadius: BorderRadius.only(
                  //圆角
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              // 栏布局
              child: Column(children: <Widget>[
                FavoriteContacts(), //收藏联系人
              ])),
        ),
      ]),
    );
  }
}
