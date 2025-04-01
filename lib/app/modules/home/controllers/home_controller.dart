import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:master_caller/app/routes/app_pages.dart';
import '../../../../common/essentials/model/user_model.dart';
import '../../../../common/replacements/api_checker.dart';
import '../../../../common/replacements/api_client.dart';
import '../../../../common/replacements/api_constants.dart';

class HomeController extends GetxController {
  var isLoading = false.obs;

  RxList<User> userList = <User>[].obs;

  //get all users
  getUserList() async {
    isLoading(true);
    try {
      var response = await ApiClient().getData(ApiConstants.getAllUsers);

      if (response.statusCode == 200) {
        List<dynamic> jsonResponse = response.body['users'];

        // Clear the existing list
        userList.clear();

        List<User> users =
            jsonResponse.map((json) => User.fromJson(json)).toList();

        userList.addAll(users);
      } else {
        //  showWarning(response.body.toString());
        ResponseHandler.handleResponse(response);
        isLoading(false);
      }
    } finally {
      isLoading(false);
    }
  }

  //send call to the server
  makeCall(BuildContext context, String fcmToken) async {
    isLoading(true);
    Map<String, dynamic> body = {
      "fcmToken": fcmToken,
      "title": "Incoming Video Call",
      "body": "John Doe is calling",
      "callerId": "65a7b2c3d4e5f6",
      "callType": "video",
      "roomId": "meeting_room_xyz789",
    };

    var headers = {'Content-Type': 'application/json'};

    print("jacce body===========>$body");
    var response = await ApiClient().postData(
      ApiConstants.sendCall,
      jsonEncode(body),
      headers: headers,
    );
    print(response.body);
    if (response.statusCode == 200 || response.statusCode == 201) {
      isLoading(false);
      //page route to login page

      Get.toNamed(Routes.CALL_SCREEN);
      // Navigator.push(
      //   context,
      //   MaterialPageRoute(builder: (context) => CallScreenView(callData: {})),
      // );

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
