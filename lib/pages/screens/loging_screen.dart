import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:raaqib_admin_frontend/server/admin_auth.dart';
import 'package:raaqib_admin_frontend/widgets/buttons_widgets.dart';
import 'package:raaqib_admin_frontend/widgets/input_text_feild.dart';

class LogingScreen extends StatefulWidget {
  const LogingScreen({super.key});

  @override
  State<LogingScreen> createState() => _LogingScreenState();
}

class _LogingScreenState extends State<LogingScreen> {
  final valiKey = GlobalKey<FormState>();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _passord = TextEditingController();
  final btns = ButtonsWidgets();
  bool _isloding = false;
  // inits
  @override
  void dispose() {
    _email.dispose();
    _passord.dispose();
    super.dispose();
  }

  //===============main===================
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.all(10),
        child: Form(
          key: valiKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Welcome To Admin",
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 27,
                ),
              ),
              inputFeild(_email, "Email", TextInputType.emailAddress, false),
              const SizedBox(height: 10),
              inputFeild(_passord, "Password", TextInputType.text, true),
              const SizedBox(height: 10),
              _isloding
                  ? Center(
                    child: CircularProgressIndicator(
                      color: Theme.of(context).colorScheme.secondary,
                    ),
                  )
                  : Consumer(
                    builder:
                        (context, ref, child) => btns.subBtns(
                          () {
                            if (valiKey.currentState!.validate()) {
                              loging(ref);
                            }
                          },
                          "Login",
                          context,
                        ),
                  ),
            ],
          ),
        ),
      ),
    );
  }

  Widget inputFeild(
    TextEditingController controller,
    String hint,
    TextInputType type,
    bool isPass,
  ) => InputTextFeildCos(
    controller: controller,
    hint: hint,
    type: type,
    isPass: isPass,
  );

  //
  loging(WidgetRef ref) async {
    setState(() {
      _isloding = true;
    });
    await AdminAuth().logingAdmin(
      email: _email.text,
      password: _passord.text,
      context: context,
      ref: ref,
    );
    setState(() {
      _isloding = false;
    });
  }
}
