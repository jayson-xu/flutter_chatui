import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FlatButton(
            child: Text('HOME'),
            onPressed: null,
          ),
          FlatButton(
              child: Text('CHAT'),
              onPressed: () => Navigator.pushNamed(context, '/chat'))
        ],
      )),
    );
  }
}
