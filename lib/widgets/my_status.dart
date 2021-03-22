import 'package:flutter/material.dart';
import 'package:whatsapp_clone/config/colors.dart';
import '../pages/view_status.dart';
import '../camera/page/camera_tab_page.dart';
import 'package:intl/intl.dart';

class MyStatus extends StatelessWidget {
  final image;
  final Function onTap;
  final time;
  final Widget child;
  MyStatus({this.image, this.onTap, this.child, this.time});
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Stack(
        children: [
          CircleAvatar(
            radius: 30,
            backgroundImage: image,
          ),
          child,
        ],
        alignment: Alignment.bottomRight,
      ),
      title: Text(
        'My Status',
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
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
       ' ${time==null?"":DateFormat.jm().format(DateTime.fromMillisecondsSinceEpoch(int.parse(time ?? '2')))}',
        style: TextStyle(
          color: Colors.black,
        ),
      ),
      onTap: onTap,
    );
  }
}
