import 'package:App/models/foster.dart';
import 'package:App/models/like.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'firestore.dart';
import 'like_repository.dart';

class FosterRepository extends FireStore {
  String collectionName = "Fosters";

  Future<List<Foster>> getFostersWhoLikedDog(dogId) async {
    LikesRepository likes = LikesRepository();
    List<Like> dogLikes = await likes.getLikesForDog(dogId);
    Set<String> fosterIds = Set.from(dogLikes.map((like) => like.fosterId).toList());
    List<QueryDocumentSnapshot> fosterDocs = await this.getAll();
    return fosterDocs.where((doc) => fosterIds.contains(doc['id'])).map((doc) => Foster(
      doc['name'], doc['age'], doc['phone'], doc['amountRoommates'], doc['homeType'], doc['hasBackyard'], doc['hasOtherPets']
    ));
  }
}
