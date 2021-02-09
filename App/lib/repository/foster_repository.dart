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
    var a = fosterDocs.where((doc) => fosterIds.contains(doc.id)).toList().map((doc) => Foster(
      doc.data()['name'], doc.data()['age'], doc.data()['phone'], doc.data()['amountRoommates'], doc.data()['homeType'], doc.data()['hasBackyard'], doc.data()['hasOtherPets']
    )).toList();
    print(dogLikes[0]);
    print(fosterDocs[0].data());
    print(a);
    return a;
  }
}
