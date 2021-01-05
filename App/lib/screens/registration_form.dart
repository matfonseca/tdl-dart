import 'package:flutter/material.dart';

class RegistrationForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Container(
                //width: MediaQuery.of(context).size.width / numPerRow - 20,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12.0),
                  boxShadow: [
                    BoxShadow(
                      color: Color.fromRGBO(140, 140, 140, 0.5),
                      blurRadius: 6.0,
                    )
                  ],
                ),
                padding: EdgeInsets.symmetric(
                  vertical: 20,
                  horizontal: 20,
                ),
                child: Column(
                  children: <Widget>[
                    TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Codigo de Usuario',
                      ),
                    ),
                    SizedBox(height: 8),
                    FlatButton(
                      onPressed: () {},
                      child: Text(
                        'Ingresar',
                        style: TextStyle(
                          color: Colors.black,
                        ),
                      ),
                      color: Colors.greenAccent,
                    )
                  ],
                ),
                margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
              ),
              FlatButton(
                onPressed: () {},
                child: Text(
                  'Registrarme',
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
                color: Colors.deepOrangeAccent,
              )
            ]
        )
    );
  }
  
}