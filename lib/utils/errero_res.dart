import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'package:raaqib_admin_frontend/utils/scafold_message.dart';

errorResponse(BuildContext context, http.Response res, void Function() onOK) {
  switch (res.statusCode) {
    case 200:
      return onOK();
    case 400:
      return scaFolTxt(context, jsonDecode(res.body));
    case 401:
      return scaFolTxt(context, jsonDecode(res.body));
    case 404:
      return scaFolTxt(context, jsonDecode(res.body));
    case 500:
      return scaFolTxt(context, jsonDecode(res.body)['error']);

    default:
      return scaFolTxt(context, "Error lama filaan ah ${res.body}");
  }
}
