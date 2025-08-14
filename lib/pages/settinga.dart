import 'package:flutter/material.dart';
import 'package:raaqib_admin_frontend/models/users_model.dart';
import 'package:raaqib_admin_frontend/server/admin_auth.dart';
import 'package:raaqib_admin_frontend/widgets/buttons_widgets.dart';
import 'package:raaqib_admin_frontend/widgets/input_text_feild.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  final TextEditingController _name = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _passord = TextEditingController();
  final TextEditingController _phone = TextEditingController();
  bool isLoding = false;
  final btns = ButtonsWidgets();
  final valiKey = GlobalKey<FormState>();
  //===============================main======================
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "Create a new Adming",
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
        const SizedBox(height: 9),
        // create adming
        Padding(
          padding: const EdgeInsets.all(18.0),
          child: Form(
            key: valiKey,
            child: Column(
              children: [
                inputFeild(_name, "Name", TextInputType.text, false),
                const SizedBox(height: 9),
                inputFeild(_email, "Email", TextInputType.emailAddress, false),
                const SizedBox(height: 9),
                inputFeild(_phone, "Phone", TextInputType.text, false),
                const SizedBox(height: 9),
                inputFeild(_passord, "Password", TextInputType.text, true),
                const SizedBox(height: 9),
                isLoding
                    ? Center(
                      child: CircularProgressIndicator(
                        color: Theme.of(context).colorScheme.secondary,
                      ),
                    )
                    : btns.subBtns(createeAdmin, "Save Admin", context),
              ],
            ),
          ),
        ),
      ],
    );
  }

  // Widgets
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

  //methodes
  //create admin
  createeAdmin() async {
    final admin = UsersModel(
      id: "",
      name: _name.text,
      email: _email.text,
      password: _passord.text,
      phone: _phone.text,
      token: '',
      supperadmin: false,
      valid: false,
    );
    setState(() {
      isLoding = true;
    });
    await AdminAuth().createAdmin(admin, context);
    setState(() {
      isLoding = false;
    });
  }
}
