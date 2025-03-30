import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:master_caller/app/routes/app_pages.dart';

import '../../../../common/replacements/api_checker.dart';
import '../../../../common/replacements/api_client.dart';
import '../../../../common/replacements/api_constants.dart';
import '../../../../common/replacements/constants.dart';
import '../../../../common/replacements/prefs_helpers.dart';

class SingUpPageController extends GetxController {
  var isLoading = false.obs;

  //register for a account
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController cnfpasswordController = TextEditingController();
  TextEditingController userNameController = TextEditingController();
  TextEditingController lastName = TextEditingController();

  registerAnAccount() async {
    var fcmToken = await PrefsHelper.getString(Constants.fcmToken);

    isLoading(true);
    Map<String, dynamic> body = {
      "username": userNameController.text,
      "email": emailController.text,
      "password": passwordController.text,
      "fcmToken": fcmToken,
    };

    var headers = {'Content-Type': 'application/json'};

    print("jacce body===========>" + body.toString());
    var response = await ApiClient().postData(
      ApiConstants.register,
      jsonEncode(body),
      headers: headers,
    );
    print(response.body);
    if (response.statusCode == 200 || response.statusCode == 201) {
      isLoading(false);
      //page route to login page
      Get.toNamed(Routes.LOGIN_PAGE);

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
