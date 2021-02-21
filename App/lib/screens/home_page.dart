import 'package:App/common/app_bar.dart';
import 'package:flutter/material.dart';

import 'foster_login.dart';
import 'owner_login.dart';
import 'contact.dart';


class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Home'),
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
            ElevatedButton(
              child: Text('Contactanos'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Contact()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

