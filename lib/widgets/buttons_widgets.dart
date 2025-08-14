import 'package:flutter/material.dart';

class ButtonsWidgets {
  Widget subBtns(VoidCallback onTap, String lable, BuildContext context) =>
      ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Theme.of(context).colorScheme.secondary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
          ),
          minimumSize: Size(double.infinity, 50),
        ),
        onPressed: onTap,
        child: Text(lable, style:  TextStyle(fontWeight: FontWeight.bold,color: Theme.of(context).colorScheme.primary)),
      );
}
