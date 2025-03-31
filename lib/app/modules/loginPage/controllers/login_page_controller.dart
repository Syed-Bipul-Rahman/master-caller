import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:master_caller/app/routes/app_pages.dart';

import '../../../../common/replacements/api_checker.dart';
import '../../../../common/replacements/api_client.dart';
import '../../../../common/replacements/api_constants.dart';
import '../../../../common/replacements/constants.dart';
import '../../../../common/replacements/enum_file.dart';
import '../../../../common/replacements/prefs_helpers.dart';

class LoginPageController extends GetxController {
  var isLoading = false.obs;

  //register for a account
  TextEditingController loginEmail = TextEditingController();
  TextEditingController loginPass = TextEditingController();

  loginVaiya() async {
    var fcmToken = await PrefsHelper.getString(Constants.fcmToken);


    isLoading(true);
    Map<String, dynamic> body = {
      "email": loginEmail.text,
      "password": loginPass.text,
      "fcmToken":fcmToken
    };

    var headers = {'Content-Type': 'application/json'};

    print("jacce body===========>" + body.toString());
    var response = await ApiClient().postData(
      ApiConstants.login,
      jsonEncode(body),
      headers: headers,
    );
    print(response.body);
    if (response.statusCode == 200 || response.statusCode == 201) {
      isLoading(false);
      PrefsHelper.setString(
        AppConstants.BEARER_TOKEN.toString(),
        response.body['token'],
      );

      Get.toNamed(Routes.HOME);

      if (kDebugMode) {
        print("SUCCESS BODY========>${response.body}");
      }
    } else if (response.statusCode == 400) {
      isLoading(false);
    } else {
      isLoading(false);
      ResponseHandler.handleResponse(response);
    }
  }
}
