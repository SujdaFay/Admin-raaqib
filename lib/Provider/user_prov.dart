import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:raaqib_admin_frontend/models/users_model.dart';

class UserProv extends ChangeNotifier {
  UsersModel _user = UsersModel(
    id: '',
    name: '',
    email: '',
    password: '',
    phone: '',
    token: '',
    supperadmin: false,
    valid: false,
  );
  UsersModel get getUserData => _user;

  //set user
  setUser(String res) {
    print("called");
    final user = UsersModel.fromJson(res);
    // print(user.email.isEmpty?"its emty":user.email);
    _user = user;
    print("called 2");

    notifyListeners();
  }

  //
}

final userProvider = ChangeNotifierProvider((ref) => UserProv());
