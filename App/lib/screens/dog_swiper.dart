import 'package:App/common/app_bar.dart';
import 'package:App/models/dog.dart';
import 'package:flutter/material.dart';

class LikeButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: () {},
      elevation: 2.0,
      fillColor: Colors.white,
      child: Icon(
        Icons.favorite,
        color: Colors.pink,
        size: 35.0,
      ),
      padding: EdgeInsets.all(15.0),
      shape: CircleBorder(),
    );
  }
}

class RejectButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: () {},
      elevation: 2.0,
      fillColor: Colors.white,
      child: Icon(
        Icons.beach_access,
        color: Colors.yellow,
        size: 35.0,
      ),
      padding: EdgeInsets.all(15.0),
      shape: CircleBorder(),
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

class DogProfile extends StatelessWidget {
  final Dog dog;

  DogProfile({this.dog});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Image.asset('images/funny_dog.png'),
          DogInfo(dog: dog),
          ButtonBar(
            alignment: MainAxisAlignment.spaceAround,
            children: [
              LikeButton(),
              RejectButton(),
            ],
          ),
        ],
      ),
    );
  }
}

class DogSwiper extends StatefulWidget {
  final List<Dog> dogs = [new Dog(
    'Pepe', 'Caniche', 3, 'pequeño', 'todas', 'Es un perro cariñoso, sacado de la calle.', 'fake-uri'
  )];

  // DogSwiper({this.dogs});

  @override
  _DogSwiper createState() => _DogSwiper(dogs: dogs);
}

class _DogSwiper extends State<DogSwiper> {
  final List<Dog> dogs;

  _DogSwiper({this.dogs});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "Adoptar"),
      body: DogProfile(dog: dogs[0]),
    );
  }
}