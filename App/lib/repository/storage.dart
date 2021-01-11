import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
class Storage {
  
  Future<String> uploadFile(String filePath, String ref) async {
  await Firebase.initializeApp();
  File file = File(filePath);
  firebase_storage.TaskSnapshot result = await firebase_storage.FirebaseStorage.instance.ref(ref).putFile(file);
  String location = await result.ref.getDownloadURL();
  return location;
  }
}