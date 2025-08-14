import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:raaqib_admin_frontend/Provider/user_prov.dart';
import 'package:raaqib_admin_frontend/common/global.dart';
import 'package:raaqib_admin_frontend/pages/screens/loging_screen.dart';
import 'package:raaqib_admin_frontend/pages/screens/main_screen.dart';
import 'package:raaqib_admin_frontend/server/admin_auth.dart';
import 'package:raaqib_admin_frontend/themes/themes.dart';

void main() {
  runApp(ProviderScope(child: const MyApp()));
}

class MyApp extends ConsumerStatefulWidget {
  const MyApp({super.key});

  @override
  ConsumerState<MyApp> createState() => _MyAppState();
}

class _MyAppState extends ConsumerState<MyApp> {
  /////////////////////  Vars /////////////////////
  bool _isloding = false;
  ///////////////////// Funcs ////////////////////
  Future<void> loadUserData() async {
    setState(() {
      _isloding = true;
    });
    await AdminAuth().getUserData(context: context, ref: ref);
    setState(() {
      _isloding = false;
    });
  }

  ///////////////////// states////////////////////
  @override
  void initState() {
    loadUserData();
    super.initState();
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final admin = ref.watch(userProvider.notifier).getUserData;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      key: mainNaviKey,
      title: 'Raaqib Admin',
      theme: lightThe,
      home:
          _isloding
              ? Scaffold(
                body: Center(
                  child: CircularProgressIndicator(
                    color: Theme.of(context).colorScheme.secondary,
                  ),
                ),
              )
              : admin.token.isEmpty
              ? const LogingScreen()
              : const MainScreen(),
    );
  }
}
