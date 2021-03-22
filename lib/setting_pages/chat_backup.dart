import 'package:flutter/material.dart';
import 'package:whatsapp_clone/chat/const.dart';

class ChatBackup extends StatefulWidget {
  @override
  _ChatBackupState createState() => _ChatBackupState();
}

class _ChatBackupState extends State<ChatBackup> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Chat backup"),
      ),
      body: ListView(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(
                    Icons.cloud_download,
                    color: primaryColor,
                  ),
                  Text(
                    "Last Backup",
                    style: TextStyle(color: primaryColor),
                  )
                ],
              ),
              Text("asdasd")
            ],
          )
        ],
      ),
    );
  }
}
