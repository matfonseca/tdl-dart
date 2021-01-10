import 'package:App/screens/login_form.dart';
import 'package:flutter/material.dart';

class OwnerLogin extends LoginForm {

  OwnerLogin():
        super(
          textTitle: "Dueño",
          textCode: "Codigo de Mascota",
          textEnterCodeButton: "Buscar",
          textRegisterButton: "Registrar Perro"
      );

  @override
  void onPressEnterCodeButton(String code) {
    // TODO: implement onPressEnterCodeButton
  }

  @override
  void onPressRegisterButton(BuildContext context) {
    // TODO: implement onPressRegisterButton
  }
}