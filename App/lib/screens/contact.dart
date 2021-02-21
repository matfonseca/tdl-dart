import 'package:flutter/material.dart';
import 'package:contactus/contactus.dart';
import 'package:App/common/app_bar.dart';


class Contact extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: CustomAppBar(title: 'Contactanoss'),
      backgroundColor: Colors.white,
      body: ContactUs(
        cardColor: Color.fromRGBO(140, 140, 140, 0.5),
        email: 'contacto@woof.com',
        companyName: 'WOOF',
        phoneNumber: '+5491134986213',
        linkedinURL: 'linkdin.com/woof',
        twitterHandle: 'woof',
      )
    );
  }
}
