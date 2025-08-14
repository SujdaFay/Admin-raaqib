import 'package:flutter/material.dart';
import 'package:raaqib_admin_frontend/models/post_model.dart';
import 'package:raaqib_admin_frontend/server/block_suspend.dart';

class PopMenueWidget extends StatelessWidget {
  final PostModel snap;
  const PopMenueWidget({super.key, required this.snap});

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      itemBuilder: (context) {
        return [
          PopupMenuItem(
            child: Text('Block user'),
            onTap: () async {
              BlockSuspend().blockUserAndSusbend(snap.uid, snap.id);
            },
          ),
          PopupMenuItem(
            child: Text('Suspend Post'),
            onTap: () {
              print("suspend  user");
            },
          ),
        ];
      },
    );
  }
}
