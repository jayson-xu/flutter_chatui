import 'package:flutter/material.dart';
import 'package:flutter_chatui/model/chat_data.dart';
import 'package:flutter_chatui/provider/global_model.dart';
import 'package:provider/provider.dart';

import 'msg_avatar.dart';

class TextMsg extends StatelessWidget {
  final String text;
  final ChatData model;

  TextMsg(this.text, this.model);

  @override
  Widget build(BuildContext context) {
    final globalModel = Provider.of<GlobalModel>(context);
    var body = [
      new MsgAvatar(model: model, globalModel: globalModel),
      new Text(text ?? '文字为空'),
      /*new TextItemContainer(
        text: text ?? '文字为空',
        action: '',
        isMyself: model.id == globalModel.account,
      ),*/
      new Spacer(),
    ];
    if (model.id == globalModel.account) {
      body = body.reversed.toList();
    } else {
      body = body;
    }
    return Container(
      padding: EdgeInsets.symmetric(vertical: 5.0),
      child: new Row(children: body),
    );
  }
}
