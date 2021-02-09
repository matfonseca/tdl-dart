import 'package:App/models/like.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'firestore.dart';

class LikesRepository extends FireStore {
  String collectionName = "Likes";

  Future<String> saveLike(dogId, fosterId) async {
    this.save(Like(dogId: dogId, fosterId: fosterId));
  }

  Future<List<Like>> getLikesForDog(dogId) async {
    List<QueryDocumentSnapshot> allLikes = await this.getAll();
    return allLikes.where((
      likeDocument) => likeDocument['dogId'] == dogId
    ).map(
      (data) => Like(dogId: data['dogId'], fosterId: data['fosterId'])
    ).toList();
  }
}