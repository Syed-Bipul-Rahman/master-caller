//get character list
// RxList<CharacterModel> charactersList = <CharacterModel>[].obs;
import 'dart:convert';


import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../replacements/api_checker.dart';
import '../replacements/api_client.dart';
import '../replacements/api_constants.dart';
import '../replacements/constants.dart';
import '../replacements/enum_file.dart';
import '../replacements/prefs_helpers.dart';
import 'model/user_model.dart';


class CallScreenController extends GetxController {




  // //send call to the server
  // makeCall(BuildContext context,String fcmToken) async {
  //   isLoading(true);
  //   Map<String, dynamic> body = {
  //     "fcmToken":fcmToken,
  //   "title": "Incoming Video Call",
  //     "body": "John Doe is calling",
  //     "callerId": "65a7b2c3d4e5f6",
  //     "callType": "video",
  //     "roomId": "meeting_room_xyz789"
  //   };
  //
  //   var headers = {'Content-Type': 'application/json'};
  //
  //   print("jacce body===========>" + body.toString());
  //   var response = await ApiClient().postData(
  //     ApiConstants.sendCall,
  //     jsonEncode(body),
  //     headers: headers,
  //   );
  //   print(response.body);
  //   if (response.statusCode == 200 || response.statusCode == 201) {
  //     isLoading(false);
  //     //page route to login page
  //     Navigator.push(
  //       context,
  //       MaterialPageRoute(
  //         builder: (context) => CallScreen(callData: {},),
  //       ),
  //     );
  //
  //     if (kDebugMode) {
  //       print("SUCCESS BODY========>${response.body}");
  //     }
  //   } else if (response.statusCode == 400) {
  //     isLoading(false);
  //   } else {
  //     isLoading(false);
  //     ResponseHandler.handleResponse(response);
  //   }
  // }



}
