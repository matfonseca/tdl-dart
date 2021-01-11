import 'package:App/common/app_bar.dart';
import 'package:App/screens/code_screen.dart';
import 'package:flutter/material.dart';
import 'package:App/repository/foster_repository.dart';
import 'package:App/models/foster.dart';


class FosterRegistration extends StatefulWidget {

  @override
  _FosterRegistrationState createState() => _FosterRegistrationState();
}

class _FosterRegistrationState extends State<FosterRegistration> {

  bool hasBackyard = false;
  bool hasOtherPets = false;
  final textNameController = TextEditingController();
  final textPhoneController = TextEditingController();
  final textAgeController = TextEditingController();
  final textAmountRoommatesController = TextEditingController();
  final textHomeTypeController = TextEditingController();
  FosterRepository repository = FosterRepository();

  @override
  void dispose() {
    textNameController.dispose();
    textPhoneController.dispose();
    textAgeController.dispose();
    textAmountRoommatesController.dispose();
    textHomeTypeController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(title: "Registro de adopción"),
        body: Padding(
          padding: const EdgeInsets.fromLTRB(12.0, 0, 12.0, 0),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                TextField(
                  controller: textNameController,
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 5.0),
                    border: OutlineInputBorder(),
                    labelText: "Nombre",
                  ),
                ),
                TextField(
                  controller: textPhoneController,
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 5.0),
                    border: OutlineInputBorder(),
                    labelText: "Telefono",
                  ),
                ),
                TextField(
                  controller: textAgeController,
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 5.0),
                    border: OutlineInputBorder(),
                    labelText: "Edad",
                  ),
                ),
                TextField(
                  controller: textAmountRoommatesController,
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 5.0),
                    border: OutlineInputBorder(),
                    labelText: "Cantidad de roommates",
                  ),
                ),
                TextField(
                  controller: textHomeTypeController,
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 5.0),
                    border: OutlineInputBorder(),
                    labelText: "Tipo de vivienda",
                  ),
                ),
                Column(
                  children: [
                    Row(
                      children: <Widget>[
                        Checkbox(
                          value: hasBackyard,
                          onChanged: setHasBackyard,
                        ),
                        GestureDetector(
                          onTap: () => setHasBackyard(!hasBackyard),
                          child: const Text(
                            'Tengo patio',
                          ),
                        ),
                      ],
                    ),
                   Row(
                      children: <Widget>[
                        Checkbox(
                          value: hasOtherPets,
                          onChanged: setHasOtherPets,
                        ),
                        GestureDetector(
                          onTap: () => setHasOtherPets(!hasOtherPets),
                          child: const Text(
                            'Tengo otras mascotas',
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Container(
                  alignment: AlignmentDirectional.bottomEnd,
                  child: FlatButton(
                    onPressed: () {
                      var name = this.textNameController.text;  
                      var phone = this.textPhoneController.text;
                      var age = this.textAgeController.text;
                      var amountRoommates = this.textAmountRoommatesController.text;
                      var homeType = this.textHomeTypeController.text;
                      var hasBackyard = this.hasBackyard;
                      var hasOtherPets = this.hasOtherPets;
                      Foster foster = Foster(name, age, phone, int.parse(amountRoommates), homeType, hasBackyard, hasOtherPets);
                      this.repository.save(foster).then(
                        (id) => Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => CodeScreen(code: id, continueFunction: () {
                          int count = 0;
                          Navigator.of(context).popUntil((_) => count++ >= 2);
                        }))
                      )
                      );
                      
                    },
                    child: Text(
                      "Registrar",
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                    color: Colors.greenAccent,
                  ),
                )
              ]
          ),
        )
    );
  }

  void setHasBackyard(bool newValue) {
    setState(() {
      hasBackyard = newValue;
    });
  }

  void setHasOtherPets(bool newValue) {
    setState(() {
      hasOtherPets = newValue;
    });
  }
}