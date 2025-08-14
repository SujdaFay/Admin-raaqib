import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:raaqib_admin_frontend/Provider/page_count.dart';
import 'package:raaqib_admin_frontend/Provider/user_prov.dart';
import 'package:raaqib_admin_frontend/pages/abeals_page.dart';
import 'package:raaqib_admin_frontend/pages/ban_susbend.dart';
import 'package:raaqib_admin_frontend/pages/dashboard.dart';
import 'package:raaqib_admin_frontend/pages/reports.dart';
import 'package:raaqib_admin_frontend/pages/rescent_posts.dart';
import 'package:raaqib_admin_frontend/pages/settinga.dart';
import 'package:raaqib_admin_frontend/style/responsive.dart';
import 'package:raaqib_admin_frontend/widgets/side_manu.dart';

class MainScreen extends ConsumerStatefulWidget {
  const MainScreen({super.key});

  @override
  ConsumerState<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends ConsumerState<MainScreen> {
  late List<Widget> pages;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    pages = [
      Dashboard(),
      RecentPosts(),
      Reports(),
      BanSusbend(),
      AbealsPage(),
      Settings(),
    ];
  }

  //main=================
  @override
  Widget build(BuildContext context) {
    final user = ref.watch(userProvider.notifier).getUserData;
    return Scaffold(
      drawer:
          MediaQuery.sizeOf(context).width <= 1024
              ? Drawer(child: SideManu())
              : null,
      backgroundColor: Theme.of(context).colorScheme.primary,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text(
          "Raaqib",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        centerTitle: false,
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: costumRow([
              CircleAvatar(backgroundColor: Colors.deepPurple),
              const SizedBox(width: 5),
              Text(
                "Suhayb",
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
            ]),
          ),
        ],
      ),
      body: Row(
        children: [
          Responsive.isDesck(context)
              ? Expanded(flex: 1, child: SideManu())
              : Container(),
          Expanded(
            flex: 5,
            child: Consumer(
              builder: (context, ref, child) {
                final pageIndex = ref.watch(pageCount);
                return Container(child: pages[pageIndex]);
              },
            ),
          ),
        ],
      ),
    );
  }

  //widgets
  Widget costumRow(List<Widget> children) => Row(children: children);
}
