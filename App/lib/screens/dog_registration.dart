import 'package:App/common/app_bar.dart';
import 'package:flutter/material.dart';
import 'package:App/models/dog.dart';
import 'package:flutter/foundation.dart';
import 'package:App/repository/dog_repository.dart';
import 'package:App/screens/code_screen.dart';


class DogRegistration extends StatefulWidget {

  @override
  _DogRegistrationState createState() => _DogRegistrationState();
}

class _DogRegistrationState extends State<DogRegistration> {

  bool hasBackyard = false;
  bool hasOtherPets = false;
  final textNameController = TextEditingController();
  final textBreedController = TextEditingController();
  final textAgeController = TextEditingController();
  final textSizeController = TextEditingController();
  final textVaccinesController = TextEditingController();
  final textDescriptionController = TextEditingController();


  @override
  void dispose() {
    textNameController.dispose();
    textBreedController.dispose();
    textAgeController.dispose();
    textSizeController.dispose();
    textVaccinesController.dispose();
    textDescriptionController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(title: "Registrar Perro"),
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
                  controller: textBreedController,
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 5.0),
                    border: OutlineInputBorder(),
                    labelText: "Raza",
                  ),
                ),
                TextField(
                  controller: textSizeController,
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 5.0),
                    border: OutlineInputBorder(),
                    labelText: "Tamaño",
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
                  controller: textVaccinesController,
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 5.0),
                    border: OutlineInputBorder(),
                    labelText: "Vacunas",
                  ),
                ),
                TextField(
                  controller: textDescriptionController,
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 5.0),
                    border: OutlineInputBorder(),
                    labelText: "Descripcion",
                  ),
                ),
                Container(
                  alignment: AlignmentDirectional.bottomEnd,
                  child: FlatButton(
                    onPressed: () {
                      var name = this.textNameController.text;
                      var breed = this.textBreedController.text;
                      var size = this.textSizeController.text;
                      var age = this.textAgeController.text;
                      var vaccines = this.textVaccinesController.text;
                      var description = this.textDescriptionController.text;
                      Dog dog = Dog(name, breed, int.parse(age), size, vaccines, description);
                      DogRepository repository = DogRepository();
                      repository.save(dog).then((String id) => {
                        Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => CodeScreen(code: id, continueFunction: () {
                          int count = 0;
                          Navigator.of(context).popUntil((_) => count++ >= 2);
                        }))
                      )
                      });
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