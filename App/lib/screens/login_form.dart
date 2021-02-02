import 'package:App/common/app_bar.dart';
import 'package:flutter/material.dart';

abstract class LoginForm extends StatelessWidget {
  final String textTitle;
  final String textCode;
  final String textEnterCodeButton;
  final String textRegisterButton;
  final textCodeController = TextEditingController();

  LoginForm({ this.textTitle, this.textCode, this.textEnterCodeButton, this.textRegisterButton });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(title: textTitle),
        body: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Container(
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
                      controller: textCodeController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: textCode,
                      ),
                    ),
                    SizedBox(height: 8),
                    FlatButton(
                      onPressed: () {
                        onPressEnterCodeButton(context, textCodeController.text);
                      },
                      child: Text(
                        textEnterCodeButton,
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
                onPressed: () {
                  onPressRegisterButton(context);
                },
                child: Text(
                  textRegisterButton,
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

  void onPressEnterCodeButton(BuildContext context, String code);

  void onPressRegisterButton(BuildContext context);
  
}