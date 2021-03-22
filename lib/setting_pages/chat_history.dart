import 'package:flutter/material.dart';
import 'package:whatsapp_clone/config/colors.dart';

class ChatHistory extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chat history'),
      ),
      body: Column(
        children: [
          ListTile(
            leading: Icon(
              Icons.receipt,
              color: darkColor,
            ),
            title: Text(
              'Export chat',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          ListTile(
            leading: Icon(
              Icons.reduce_capacity,
              color: darkColor,
            ),
            title: Text(
              'Archive all chats',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          ListTile(
            leading: Icon(
              Icons.airline_seat_recline_normal_outlined,
              color: darkColor,
            ),
            title: Text(
              'Clear all Chats',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          ListTile(
            leading: Icon(
              Icons.delete,
              color: darkColor,
            ),
            title: Text(
              'Delete all chats',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
