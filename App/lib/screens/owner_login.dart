import 'package:App/screens/registration_form.dart';

class OwnerLogin extends RegistrationForm {

  OwnerLogin():
        super(
          textTitle: "Dueño",
          textCode: "Codigo de Mascota",
          textEnterCodeButton: "Buscar",
          textRegisterButton: "Registrar Perro"
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