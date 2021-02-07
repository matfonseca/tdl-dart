import 'package:App/repository/storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'firestore.dart';
import 'package:App/models/dog.dart';

class DogRepository extends FireStore with Storage {
  String collectionName = "Dogs";

  Future<Dog> getModel(id) async{
    Map<String, dynamic> data =  await this.get(id);

    return Dog(name: data["name"],
        breed: data["breed"],
        age: data["age"],
        size: data["size"],
        vaccines: data["vaccines"],
        description: data["description"],
        imageUri: data["image_uri"],
        dogId: id
    );
  }

  Future<List<Dog>> getDogs() async{
    List<QueryDocumentSnapshot> dogsDocuments = await this.getAll();
    return dogsDocuments.map((data) => Dog(
        name: data["name"],
        breed: data["breed"],
        age: data["age"],
        size: data["size"],
        vaccines: data["vaccines"],
        description: data["description"],
        imageUri: data["image_uri"],
        dogId: data.id
    )).toList();
  }

  Future<String> saveModel(dog, imagePath) async {
      String uri = await this.uploadImage(imagePath, dog.name);
      dog.setImageUri(uri);
      return this.save(dog);
  }

  Future<String> uploadImage(String filePath, String dogName) async {
    String fileName = filePath.split("/").last;
    String ref = "images/$dogName/$fileName";
    return this.uploadFile(filePath, ref);
  }
}