import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

class FireStore  {
    String collectionName;

    FireStore(){
      Firebase.initializeApp();
    }

    Future<String> save(model) async {
      var record = model.toJson();
      DocumentReference doc = await FirebaseFirestore.instance.collection(this.collectionName).add(record);
      return doc.id;
    }

    Future<Map<String, dynamic>> get(id) async {
      DocumentSnapshot doc = await FirebaseFirestore.instance.collection(this.collectionName).doc(id).get();
      
      if (doc.exists) {
          return doc.data();
        } else {
        //TODO:MANEJAR ERROR DE ID NO EXISTENTE
      }

    }

}