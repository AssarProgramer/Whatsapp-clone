import 'package:flutter/material.dart';
import 'package:whatsapp_clone/auths/registranion_page.dart';

void registrationPageNavigator(context) {
  Navigator.pushReplacement(
    context,
    MaterialPageRoute(
      builder: (_) => RegistrationPage(),
    ),
  );
}
