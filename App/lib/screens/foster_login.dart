import 'package:App/screens/registration_form.dart';

class FosterLogin extends RegistrationForm {

  FosterLogin():
      super(
        textTitle: "Adoptar",
        textCode: "Codigo de Usuario",
        textEnterCodeButton: "Ingresar",
        textRegisterButton: "Registrarme"
      );


  @override
  void onPressEnterCodeButton() {
    // TODO: implement onPressEnterCodeButton
  }

  @override
  void onPressRegisterButton() {
    // TODO: implement onPressRegisterButton
  }
}