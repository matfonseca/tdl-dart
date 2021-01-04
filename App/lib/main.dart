import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    title: 'Navigation Basics',
    home: HomePage(),
  ));
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row( // codigo repetido, hacer una clase custom para el titulo
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'images/barking.png',
              fit: BoxFit.contain,
              height: 32,
            ),
            Container(
              padding: const EdgeInsets.all(8.0), child: Text('WOOF')
            )
          ],
        ),
      ),
      body: Center(
        child:  Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              child: Text('Adoptar'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => FosterLogin()),
                );
              },
            ),
            ElevatedButton(
              child: Text('Dueño'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => OwnerLogin()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class FosterLogin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row( // codigo repetido, hacer una clase custom para el titulo
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'images/barking.png',
              fit: BoxFit.contain,
              height: 32,
            ),
            Container(
              padding: const EdgeInsets.all(8.0), child: Text('WOOF - Adoptar')
            )
          ],
        ),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text('Go back!'),
        ),
      ),
    );
  }
}


class OwnerLogin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row( // codigo repetido, hacer una clase custom para el titulo
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'images/barking.png',
              fit: BoxFit.contain,
              height: 32,
            ),
            Container(
              padding: const EdgeInsets.all(8.0), child: Text('WOOF - Dueño')
            )
          ],
        ),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text('Go back!'),
        ),
      ),
    );
  }
}


