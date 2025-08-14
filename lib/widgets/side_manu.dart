import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:raaqib_admin_frontend/Provider/page_count.dart';

class SideManu extends StatelessWidget {
  const SideManu({super.key});

  @override
  Widget build(BuildContext context) {
    const List<IconData> icons = [
      Icons.home,
      CupertinoIcons.viewfinder_circle_fill,
      Icons.flag_sharp,
      CupertinoIcons.pencil_slash,
      CupertinoIcons.speaker_2_fill,
      Icons.settings,
    ];
    const List<String> labels = [
      "Dashboard",
      "Recent posts",
      "Reports",
      "Bans & Sespended",
      "Abeals",
      "Settings",
    ];
    return ListView.builder(
      itemCount: icons.length,
      itemBuilder: (context, index) {
        final icon = icons[index];
        final lable = labels[index];

        return Consumer(
          builder: (context, ref, child) {
            final count = ref.watch(pageCount);
            return InkWell(
              borderRadius: BorderRadius.circular(10),
              onTap: () {
                ref.read(pageCount.notifier).update((st) => index);
              },
              child: Container(
                alignment: Alignment.center,
                margin: const EdgeInsets.all(5),
                child: coustomRow(icon, lable, count == index),
              ),
            );
          },
        );
      },
    );
  }

  //Widgets
  Widget coustomRow(IconData icon, String lable, bool currentIndex) => Row(
    children: [
      Padding(padding: const EdgeInsets.all(8.0), child: Icon(icon)),
      Text(
        lable,
        style: TextStyle(
          fontWeight: currentIndex ? FontWeight.bold : FontWeight.w500,
        ),
      ),
    ],
  );
}
