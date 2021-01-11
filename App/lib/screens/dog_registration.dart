import 'package:App/common/app_bar.dart';
import 'package:flutter/material.dart';
import 'package:App/models/dog.dart';
import 'package:flutter/foundation.dart';
import 'package:App/repository/dog_repository.dart';
import 'package:App/screens/code_screen.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:App/repository/storage.dart';



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
  String _size;
  File galleryFile;

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

    imageSelectorGallery() async {
      galleryFile = await ImagePicker.pickImage(
        source: ImageSource.gallery,
        // maxHeight: 50.0,
        // maxWidth: 50.0,
      );
      print("You selected gallery image : " + galleryFile.path);
      setState(() {});
    }

    return Scaffold(
        appBar: CustomAppBar(title: "Registrar Perro"),
        body: Padding(
          padding: const EdgeInsets.fromLTRB(12.0, 0, 12.0, 0),
          child: ListView(
              children: <Widget>[
                displaySelectedFile(galleryFile),
                new RaisedButton(
                child: new Text('Seleccione la imagen de la galeria'),
                onPressed: imageSelectorGallery,
                ),
                SizedBox(height: 10),
                TextField(
                  controller: textNameController,
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 5.0),
                    border: OutlineInputBorder(),
                    labelText: "Nombre",
                  ),
                ),
                SizedBox(height: 10),
                DropdownButton(
                hint: Text("Tamaño"),
                isExpanded:true,
                value: _size,
                items: [
                  DropdownMenuItem(
                    child: Text("Pequeño"),
                    value: "Pequeño",
                  ),
                  DropdownMenuItem(
                    child: Text("Mediano"),
                    value: "Mediano",
                  ),
                  DropdownMenuItem(
                    child: Text("Grande"),
                    value: "Grande",
                  )
                ],
                onChanged: (value) {
                  setState(() {
                    _size = value;
                  });
                }),
                SizedBox(height: 10),
                TextField(
                  controller: textBreedController,
                  
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 5.0),
                    border: OutlineInputBorder(),
                    labelText: "Raza",
                  ),
                ),  
                SizedBox(height: 10),
                TextField(
                  controller: textAgeController,
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 5.0),
                    border: OutlineInputBorder(),
                    labelText: "Edad",
                    
                  ),
                ),
                SizedBox(height: 10),
                TextField(
                  controller: textVaccinesController,
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 5.0),
                    border: OutlineInputBorder(),
                    labelText: "Vacunas",
                  ),
                ),
                SizedBox(height: 10),
                TextField(
                  controller: textDescriptionController,
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 5.0),
                    border: OutlineInputBorder(),
                    labelText: "Descripcion",
                  ),
                ),
                SizedBox(   //Use of SizedBox 
                    height: 20, 
                    ),
                Container(
                  alignment: AlignmentDirectional.bottomEnd,
                  child: FlatButton(
                    onPressed: () {
                      var name = this.textNameController.text;  
                      var breed = this.textBreedController.text;
                      var age = this.textAgeController.text;
                      var vaccines = this.textVaccinesController.text;
                      var description = this.textDescriptionController.text;
                      Dog dog = Dog(name, breed, int.parse(age), _size, vaccines, description);
                      DogRepository repository = DogRepository();
                      repository.saveModel(dog, galleryFile.path).then((String id) => {
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

   Widget displaySelectedFile(File file) {
    return new SizedBox(
      height: 200.0,
      width: 300.0,
//child: new Card(child: new Text(''+galleryFile.toString())),
//child: new Image.file(galleryFile),
      child: file == null
          ? new Text('')
          : new Image.file(file),
    );
  }
}