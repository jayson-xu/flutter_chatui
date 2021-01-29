import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chatui/widgets/category_selector.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      body: Column(
        children:<Widget>[
          CategorySelector(), //类别选择器
        ]
      ),
    );
  }
}
