import 'dart:io';

import 'package:flutter/cupertino.dart';
import '../../model/chat_data.dart';
import '../message_view/text_msg.dart';

class SendMessageView extends StatefulWidget {
  final ChatData model;

  SendMessageView(this.model, {Key key}) : super(key: key);

  @override
  _SendMessageViewState createState() => _SendMessageViewState();
}

class _SendMessageViewState extends State<SendMessageView> {
  @override
  Widget build(BuildContext context) {
    Map msg = widget.model.msg;
    String msgType = msg['type'];
    String msgStr = msg.toString();

    bool isI = Platform.isIOS;
    bool iosText = isI && msgStr.contains('text:');
    bool iosImg = isI && msgStr.contains('imageList:');
    var iosS = msgStr.contains('downloadFlag:') && msgStr.contains('second:');
    bool iosSound = isI && iosS;
    if (msgType == "Text" || iosText) {
      return new TextMsg(msg['text'], widget.model);
    /*} else if (msgType == "Image" || iosImg) {
      return new ImgMsg(msg, widget.model);
    } else if (msgType == 'Sound' || iosSound) {
      return new SoundMsg(widget.model);
    } else if (msg['tipsType'] == 'Join') {
      return JoinMessage(msg);
    } else if (msg['tipsType'] == 'Quit') {
      return QuitMessage(msg);
    } else if (msg['groupInfoList'][0]['type'] == 'ModifyIntroduction') {
      return ModifyNotificationMessage(msg);
    } else if (msg['groupInfoList'][0]['type'] == 'ModifyName') {
      return ModifyGroupInfoMessage(msg);*/
    } else {
      return new Text('未知消息');
    }
  }
}
