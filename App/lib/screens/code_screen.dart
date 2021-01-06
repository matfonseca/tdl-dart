import 'package:App/common/app_bar.dart';
import 'package:flutter/material.dart';

class CodeScreen extends StatelessWidget {
  final String code;
  final VoidCallback continueFunction;

  CodeScreen({ this.code, this.continueFunction });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(title: "Codigo"),
        body: Center (
            child: Column (
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "Tu codigo es",
                  ),
                  Text(
                    this.code,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text("Guardar este codigo para ingresar"),
                  SizedBox(height: 20),
                  FlatButton(
                    onPressed: this.continueFunction,
                    child: Text(
                      "Continuar",
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                    color: Colors.greenAccent,
                  ),
                ]
            )
        )
    );
  }


}