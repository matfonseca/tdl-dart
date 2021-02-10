import 'package:App/common/app_bar.dart';
import 'package:flutter/material.dart';
import 'package:clipboard/clipboard.dart';

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
                  Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                    this.code,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  IconButton(
                  icon: new Icon(Icons.content_copy, size:20),
                  highlightColor: Colors.pink,
                  onPressed:(){
                        FlutterClipboard.copy(this.code);
                        }
                  ),
                  ],
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