import 'package:App/repository/storage.dart';
import 'firestore.dart';
import 'package:App/models/dog.dart';
import 'package:App/repository/storage.dart';

class DogRepository extends FireStore with Storage {
  String collectionName = "Dogs";

  Future<Dog> getModel(id) async{
    Map<String, dynamic> data =  await this.get(id);
    return Dog(data["name"], data["breed"], data["age"], data["size"], data["vaccines"], data["description"]); 
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