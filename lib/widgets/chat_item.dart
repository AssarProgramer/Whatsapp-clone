import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ChatItem extends StatefulWidget {
  final FontWeight fontWeight;
  final Widget divider;
  final String title;
  final time;
  final image;
  final Function onTap;
  ChatItem(
      {this.fontWeight,
      this.divider,
      this.image,
      this.title,
      this.onTap,
      this.time});
  @override
  _ChatItemState createState() => _ChatItemState();
}

class _ChatItemState extends State<ChatItem> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          leading: CircleAvatar(
            radius: 30,
            backgroundImage: widget.image,
          ),
          title: Text(
            widget.title ?? '',
            style: TextStyle(
              fontSize: 18,
              fontWeight: widget.fontWeight,
              color: Colors.black,
            ),
          ),
          subtitle: Text(
            'Hi there! i am flutter developer',
            style: TextStyle(
              fontSize: 18,
              color: Colors.black45,
            ),
            overflow: TextOverflow.ellipsis,
          ),
          trailing: Text(
            DateFormat.jm().format(
              DateTime.fromMillisecondsSinceEpoch(
                int.parse(widget.time ?? '2'),
              ),
            ),
            style: TextStyle(
              color: Colors.black,
            ),
          ),
          onTap: widget.onTap,
        ),
        widget.divider
      ],
    );
  }
}
