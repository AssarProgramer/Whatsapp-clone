import 'package:flutter/material.dart';
import 'package:whatsapp_clone/chat/const.dart';
import 'package:whatsapp_clone/model/currentUser.dart';
import '../change_number.dart';

class YourProfileScreen extends StatelessWidget {
  CurrentUser currentUser;
  YourProfileScreen({this.currentUser});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
      ),
      body: ListView(
        children: <Widget>[
          Container(
            padding: const EdgeInsets.only(
              top: 32.0,
              bottom: 16.0,
            ),
            child: Stack(
              alignment: Alignment.center,
              children: <Widget>[
                Hero(
                  tag: 'profile-pic',
                  child: CircleAvatar(
                    radius: 70.0,
                    backgroundImage:
                        NetworkImage(currentUser.currrentUserImage),
                  ),
                ),
                Positioned(
                  bottom: 20.0,
                  right: 160.0,
                  child: FloatingActionButton(
                      backgroundColor: primaryColor,
                      mini: true,
                      child: Icon(
                        Icons.camera_alt,
                        color: Colors.white,
                      ),
                      onPressed: () {}),
                )
              ],
            ),
          ),
          ListTile(
            contentPadding:
                const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
            leading: Icon(
              Icons.account_circle,
              color: Color.fromRGBO(7, 94, 84, 0.7),
            ),
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'Name',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 15.0,
                  ),
                ),
                Text(
                  currentUser.currentUserName,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16.0,
                  ),
                )
              ],
            ),
            subtitle: Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Text('This is not your username or pin. This name will be '
                  'visible to your pak 1 contacts.'),
            ),
            trailing: Icon(Icons.mode_edit),
            onTap: () {},
          ),
          Divider(
            height: 0.0,
            indent: 72.0,
          ),
          ListTile(
            contentPadding:
                const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
            leading: Icon(
              Icons.info_outline,
              color: Color.fromRGBO(7, 94, 84, 0.7),
            ),
            title: Text(
              'About',
              style: TextStyle(
                color: Colors.grey,
                fontSize: 15.0,
              ),
            ),
            subtitle: Text(
              'Hey, I am using pak 1!!',
              style: TextStyle(
                color: Colors.black,
                fontSize: 16.0,
              ),
            ),
            trailing: Icon(Icons.mode_edit),
            onTap: () {},
          ),
          Divider(
            height: 0.0,
            indent: 72.0,
          ),
          ListTile(
            contentPadding:
                const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
            leading: Icon(
              Icons.call,
              color: Color.fromRGBO(7, 94, 84, 0.7),
            ),
            title: Text(
              'Phone',
              style: TextStyle(
                color: Colors.grey,
                fontSize: 15.0,
              ),
            ),
            subtitle: Text(
              currentUser.currentUserNumber,
              style: TextStyle(
                color: Colors.black,
                fontSize: 16.0,
              ),
            ),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (ctx) => ChangeNumber(),
                ),
              );
            },
          )
        ],
      ),
    );
  }
}
