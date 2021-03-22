import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SingleItemChatUserPage extends StatelessWidget {
  final String time;
  final String recentSendMessage;
  final String name;
  final String profile;

  const SingleItemChatUserPage(
      {Key key, this.time, this.recentSendMessage, this.name, this.profile})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListTile(
        leading: CircleAvatar(
          radius: 30,
          backgroundColor: Colors.grey,
          backgroundImage: NetworkImage(profile),
        ),
        title: Padding(
          padding: const EdgeInsets.only(top: 8),
          child: Text('$name'),
        ),
        subtitle: Text(
          '$recentSendMessage',
        overflow: TextOverflow.ellipsis,
        ),
        trailing: Text('$time'),
      ),
    );

  }
}
