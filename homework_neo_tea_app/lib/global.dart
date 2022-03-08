import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:homework_neo_tea_app/common/utils/util_http.dart';
import 'package:homework_neo_tea_app/common/utils/util_storage.dart';
import 'package:homework_neo_tea_app/common/values/value_storage.dart';

import 'common/models/user_sign_in.dart';

class Global {
  static bool isFirstOpen = false;
  static bool isOffline = false;

  static UserLoginResponseModel profile = UserLoginResponseModel(
    data: null,
  );

  Future init() async {
    WidgetsFlutterBinding.ensureInitialized();

    await StorageUtil.init();
    HttpUtil();

    isFirstOpen = !StorageUtil().getBool(STORAGE_FIRST_OPEN);
    if (isFirstOpen) StorageUtil().setBool(STORAGE_FIRST_OPEN, true);

    var _userProfileJson = StorageUtil().getJson(STORAGE_USER_PROFILE_KEY);
    if (_userProfileJson != null) {
      profile = UserLoginResponseModel.fromJson(_userProfileJson);
      isOffline = true;

      print(profile.data!.token.toString());
    }

    if (Platform.isAndroid) {
      SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
      ));
    }
  }

  static saveFirstOpen() {
    StorageUtil().setBool(STORAGE_FIRST_OPEN, false);
  }

  static Future<bool> saveUserProfile(
      UserLoginResponseModel userSignInResponseModel) {
    return StorageUtil()
        .setJson(STORAGE_USER_PROFILE_KEY, userSignInResponseModel.toJson());
  }
}
