import 'package:App/common/app_bar.dart';
import 'package:App/models/dog.dart';
import 'package:App/repository/dog_repository.dart';
import 'package:App/repository/like_repository.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class LikeButton extends StatelessWidget {
  final onPress;
  final Dog dog;

  LikeButton({this.onPress, this.dog});

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: () {
        onPress(this.dog);
        },
      elevation: 3.0,
      fillColor: Colors.white, 
      child: Icon(
        Icons.favorite,
        color: Colors.pink,
        size: 35.0,
      ),
      padding: EdgeInsets.all(15.0),
      shape: CircleBorder(side: BorderSide(color: Colors.pink[100])),
    );
  }
}

class RejectButton extends StatelessWidget {
  final onPress;
  final Dog dog;

  RejectButton({this.onPress, this.dog});

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: () {onPress(this.dog);},
      elevation: 3.0,
      fillColor: Colors.white,
      child: Icon(
        Icons.remove_outlined,
        color: Colors.amber,
        size: 35.0,
      ),
      padding: EdgeInsets.all(15.0),
      shape: CircleBorder(side: BorderSide(color: Colors.amber[100])),
    );
  }
}

class DogInfo extends StatelessWidget {
  final Dog dog;

  DogInfo({this.dog});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ListTile(
          dense: true,
          title: Text(
            '${dog.name}, ${dog.age}',
            style: TextStyle(fontSize: 18),
          ),
          subtitle: Text(
            '${dog.breed}',
            style: TextStyle(color: Colors.black.withOpacity(0.6)),
          ),
        ),
        Container(
          padding: EdgeInsets.only(left: 16.0, right: 8.0, top: 4.0, bottom: 8.0),
          child: 
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 16.0),
                  child: Align(alignment: Alignment.bottomLeft, child: Text('${dog.description}', style: TextStyle(color: Colors.black.withOpacity(0.6)),)),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 4.0),
                  child: Align(alignment: Alignment.bottomLeft, child: Text('Vacunas: ${dog.vaccines}', style: TextStyle(color: Colors.black.withOpacity(0.6)),)),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 4.0),
                  child: Align(alignment: Alignment.bottomLeft, child: Text('Tamaño: ${dog.size}', style: TextStyle(color: Colors.black.withOpacity(0.6)),)),
                )
            ],
          ),
        ),
    ],);
  }
}

class DogProfilePicture extends StatelessWidget {
  final pictureUrl;

  DogProfilePicture({this.pictureUrl});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[50],
      width: 375,
      height: 390,
      child: CachedNetworkImage(
        imageUrl: this.pictureUrl,
        placeholder: (context, url) => Container(child: CircularProgressIndicator(), width: 50, height: 50),
        errorWidget: (context, url, error) => Icon(Icons.error),
      ),
    );
  }
}

class DogProfile extends StatelessWidget {
  final Dog dog;

  final onLike;
  final onPass;

  DogProfile({this.dog, this.onLike, this.onPass});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          DogProfilePicture(pictureUrl: this.dog.imageUri),
          DogInfo(dog: dog),
          ButtonBar(
            alignment: MainAxisAlignment.spaceAround,
            children: [
              RejectButton(onPress: onPass, dog: dog),
              LikeButton(onPress: onLike, dog: dog),
            ],
          ),
        ],
      ),
    );
  }
}

class DogSwiper extends StatefulWidget {
  final List<Dog> dogs;
  final String fosterId;

  DogSwiper({this.dogs, this.fosterId});

  @override
  _DogSwiper createState() => _DogSwiper(dogs: this.dogs, fosterId: this.fosterId);
}

class _DogSwiper extends State<DogSwiper> {
  final List<Dog> dogs;
  final String fosterId;
  int _dogIndex = 0;
  final LikesRepository likesRepository = LikesRepository();

  _DogSwiper({this.dogs, this.fosterId});

  void _passDog() {
    setState(() {
      _dogIndex++;
      if (_dogIndex == dogs.length) {
        _dogIndex = 0;
      }
    });
  }
  void _onLike(Dog dog) {
    // save like with fosterCode, idDog
    likesRepository.saveLike(dog.dogId, fosterId);
    _passDog();
  }

  void _onDislike(Dog dog) {
    _passDog();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "Adoptar"),
      body: DogProfile(dog: dogs[_dogIndex], onLike: _onLike, onPass: _onDislike),
    );
  }
}