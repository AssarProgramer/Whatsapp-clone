import 'package:flutter/material.dart';
import 'package:whatsapp_clone/config/colors.dart';

class Wellpaper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Light Theme Wellpaper"),
      ),
      body: Column(
        children: [
          Image.asset('assets/image.jpg'),
          Text(
            "CHANGE",
            style: TextStyle(
                color: darkColor, fontWeight: FontWeight.bold, fontSize: 20),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            "To change your wellpaper for dark theme,trun on dark",
            style: TextStyle(
              fontSize: 16,
              color: Color(0xff858b90),
            ),
          ),
          Text(
            "theme form Settings > Chats > Theme",
            style: TextStyle(
              fontSize: 16,
              color: Color(0xff858b90),
            ),
          )
        ],
      ),
    );
  }
}
