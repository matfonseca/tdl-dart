import 'package:App/repository/foster_repository.dart';
import 'package:App/screens/login_form.dart';
import 'package:flutter/material.dart';
import 'dog_registration.dart';
import 'foster_search.dart';

class OwnerLogin extends LoginForm {

  final FosterRepository repository = FosterRepository();

  OwnerLogin():
        super(
          textTitle: "Dueño",
          textCode: "Codigo de Mascota",
          textEnterCodeButton: "Buscar",
          textRegisterButton: "Registrar Perro"
      );

  @override
  void onPressEnterCodeButton(BuildContext context, String code) {
    repository.getFostersWhoLikedDog(code).then((fosters) => {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => FosterSearch(code: code, fosters: fosters)),
      )
    });
  }

  @override
  void onPressRegisterButton(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => DogRegistration()),
    );
  }
}