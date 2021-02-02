import 'package:App/screens/foster_registration.dart';
import 'package:App/screens/login_form.dart';
import 'package:flutter/material.dart';

class FosterLogin extends LoginForm {

  FosterLogin():
      super(
        textTitle: "Adoptar",
        textCode: "Codigo de Usuario",
        textEnterCodeButton: "Ingresar",
        textRegisterButton: "Registrarme"
      );


  @override
  void onPressEnterCodeButton(BuildContext context, String code) {
    // TODO: implement onPressEnterCodeButton
  }

  @override
  void onPressRegisterButton(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => FosterRegistration()),
    );
  }
}