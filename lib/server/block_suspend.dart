import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:raaqib_admin_frontend/common/global.dart';

class BlockSuspend {
  Future<void> blockUserAndSusbend(String userID, String postID) async {
    
    try {
      final res = await http.post(
        Uri.parse("$uri/block-list"),
        headers: {'Content-Type': 'application/json;charset=UTF-8'},
        body: jsonEncode({"userId": userID, "postID": postID}),
      );
      if (res.statusCode == 200) {
        print('User was blocked');
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
