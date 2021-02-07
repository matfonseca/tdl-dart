import 'package:App/models/like.dart';

import 'firestore.dart';

class LikesRepository extends FireStore {
  String collectionName = "Likes";

  Future<String> saveLike(dogId, fosterId) async {
    this.save(Like(dogId: dogId, fosterId: fosterId));
  }
}