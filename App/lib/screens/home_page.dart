import 'package:flutter/material.dart';

import 'foster_login.dart';
import 'owner_login.dart';
import 'package:App/common/tittle.dart';


class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar('Home'),
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

