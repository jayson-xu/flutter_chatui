import 'package:flutter/material.dart';
import 'package:flutter_chatui/pages/chat_page.dart';
import 'package:flutter_chatui/pages/home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        /*home: Center(
          child: Text(
            'Flutter Chat UI',
            // 设置字体风格
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            )
          )
        ),*/
        initialRoute: '/',
        routes: {
          '/': (context) => HomePage(),
          '/chat': (context) => ChatPage(),
        });
  }
}
