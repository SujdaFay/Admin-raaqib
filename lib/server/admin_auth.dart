import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:raaqib_admin_frontend/Provider/user_prov.dart';
import 'package:raaqib_admin_frontend/common/global.dart';
import 'package:raaqib_admin_frontend/models/users_model.dart';
import 'package:raaqib_admin_frontend/pages/screens/loging_screen.dart';
import 'package:raaqib_admin_frontend/pages/screens/main_screen.dart';
import 'package:raaqib_admin_frontend/utils/errero_res.dart';
import 'package:raaqib_admin_frontend/utils/scafold_message.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AdminAuth {
  // create and adming
  Future<void> createAdmin(UsersModel adminAuth, BuildContext context) async {
    pop(gg) {
      scaFolTxt(context, gg);
    }

    httpErrorRes(http.Response res) {
      errorResponse(context, res, () {
        pop("user created");
      });
    }

    try {
      final res = await http.post(
        Uri.parse("$uri/c_admin"),
        headers: {'Content-Type': 'application/json;charset=UTF-8'},
        body: adminAuth.toJson(),
      );
      httpErrorRes(res);
    } catch (e) {
      pop(e.toString());
    }
  }

  // log in
  Future<void> logingAdmin({
    required String email,
    required String password,
    required BuildContext context,
    required WidgetRef ref,
  }) async {
    final userPro = ref.read(userProvider.notifier);
    pop(gg) {
      scaFolTxt(context, gg);
    }

    httpRes(http.Response res) {
      errorResponse(context, res, () async {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => MainScreen()),
        );
        userPro.setUser(res.body);
        pop("Welcom Back");
        final SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.setString(sukdaKey, jsonDecode(res.body)['token']);
      });
    }

    try {
      final res = await http.post(
        Uri.parse("$uri/ad-login"),
        headers: {'Content-Type': 'application/json;charset=UTF-8'},
        body: jsonEncode({"email": email, "password": password}),
      );
      httpRes(res);
    } catch (e) {
      pop(e.toString());
    }
  }

  Future<void> getUserData({
    required BuildContext context,
    required WidgetRef ref,
  }) async {
    nav() {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        mainNaviKey.currentState?.pushReplacement(
          MaterialPageRoute(builder: (context) => LogingScreen()),
        );
      });
    }

    pop(gg) {
      scaFolTxt(context, gg);
    }

    try {
      final user = ref.read(userProvider.notifier);
      final SharedPreferences pref = await SharedPreferences.getInstance();
      final token = pref.getString(sukdaKey);
      if (token == null) {
        nav();
        return;
      }
      if (token.isEmpty) {
        nav();
        return;
      }
      final res = await http.get(
        Uri.parse("$uri/"),
        headers: {
          'Content-Type': 'application/json;charset=UTF-8',
          sukdaKey: token,
        },
      );
      // print(jsonDecode(res.body));
      if (res.statusCode != 200) {
        // print("${res.statusCode}=====${res.body}");
        nav();
        return;
      }
      //
      user.setUser(res.body);
    } catch (e) {
      pop(e.toString());
    }
  }
}
