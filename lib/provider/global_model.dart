import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_chatui/config/keys.dart';
import 'package:flutter_chatui/model/i_person_info_entity.dart';
import 'package:flutter_chatui/tools/shared_util.dart';
import 'dart:convert';

import 'logic/global_logic.dart';

class GlobalModel extends ChangeNotifier {
  BuildContext context;

  ///app的名字
  String appName = "微信flutter";

  /// 用户信息
  String account = '';
  String nickName = 'nickName';
  String avatar = '';
  int gender = 0;

  ///当前语言
  List<String> currentLanguageCode = ["zh", "CN"];
  String currentLanguage = "中文";
  Locale currentLocale;

  ///是否进入登录页
  bool goToLogin = true;

  GlobalLogic logic;

  GlobalModel() {
    logic = GlobalLogic(this);
  }

  void setContext(BuildContext context) {
    if (this.context == null) {
      this.context = context;
      Future.wait([
        logic.getAppName(),
        logic.getCurrentLanguageCode(),
        logic.getCurrentLanguage(),
        logic.getLoginState(),
        logic.getAccount(),
        logic.getNickName(),
        logic.getFaceUrl(),
        logic.getGender(),
      ]).then((value) {
        currentLocale = Locale(currentLanguageCode[0], currentLanguageCode[1]);
        refresh();
      });
    }
  }

  void initInfo() async {
    final data = '[{ "nickname": "jayson", "faceUrl": "https://pub.dev/static/img/pub-dev-logo-2x.png", "gender": 0 }]'; /*TODO: await getUsersProfile([account]);*/
    if (data == null) return;
    List<dynamic> result = json.decode(data);
    if (Platform.isAndroid) {
      nickName = result[0]['nickName'];
      await SharedUtil.instance
          .saveString(Keys.nickName, result[0]['nickName']);
      avatar = result[0]['faceUrl'];
      await SharedUtil.instance.saveString(Keys.faceUrl, result[0]['faceUrl']);
      gender = result[0]['gender'];
      await SharedUtil.instance.saveInt(Keys.gender, result[0]['gender']);
    } else {
      IPersonInfoEntity model = IPersonInfoEntity.fromJson(result[0]);
      nickName = model.nickname;
      await SharedUtil.instance.saveString(Keys.nickName, model.nickname);
      avatar = model.faceURL;
      await SharedUtil.instance.saveString(Keys.faceUrl, model.faceURL);
      gender = model.gender;
      await SharedUtil.instance.saveInt(Keys.gender, model.gender);
    }
  }

  @override
  void dispose() {
    super.dispose();
    debugPrint("GlobalModel销毁了");
  }

  void refresh() {
    if (!goToLogin) initInfo();
    notifyListeners();
  }
}
