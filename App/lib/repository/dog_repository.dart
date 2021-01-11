import 'firestore.dart';
import 'package:App/models/dog.dart';

class DogRepository extends FireStore {
  String collectionName = "Dogs";

  Future<Dog> getModel(id) async{
    Map<String, dynamic> data =  await this.get(id);
    return Dog(data["name"], data["breed"], data["age"], data["size"], data["vaccines"], data["description"]); 
  }
}