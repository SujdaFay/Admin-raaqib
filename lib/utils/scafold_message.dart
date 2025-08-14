import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

scaFolTxt(BuildContext context, String txt) =>
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(txt)));
