import 'package:App/repository/dog_repository.dart';
import 'package:App/screens/dog_swiper.dart';
import 'package:App/screens/foster_registration.dart';
import 'package:App/screens/login_form.dart';
import 'package:flutter/material.dart';

class FosterLogin extends LoginForm {

  final DogRepository repository = DogRepository();

  FosterLogin():
      super(
        textTitle: "Adoptar",
        textCode: "Codigo de Usuario",
        textEnterCodeButton: "Ingresar",
        textRegisterButton: "Registrarme"
      );


  @override
  void onPressEnterCodeButton(BuildContext context, String code) {
    repository.getDogs().then((dogs) => {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => DogSwiper(dogs: dogs, fosterId: code)),
      )
    });
  }

  @override
  void onPressRegisterButton(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => FosterRegistration()),
    );
  }
}