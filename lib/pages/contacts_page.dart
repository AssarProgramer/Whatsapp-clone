import 'dart:ui';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:whatsapp_clone/config/colors.dart';
import 'package:whatsapp_clone/model/contact_model.dart';
import 'package:whatsapp_clone/widgets/chat_item.dart';
import '../chat/chat.dart';

class ContactsPage extends StatefulWidget {
  final List<ContactModel> contactMessageList;
  ContactsPage(this.contactMessageList);
  @override
  _ContactsPageState createState() => _ContactsPageState();
}

class _ContactsPageState extends State<ContactsPage> {
  User currentUser = FirebaseAuth.instance.currentUser;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: darkColor,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Select Contact',
            ),
            SizedBox(
              height: 2,
            ),
            Text(
              'contacts ${widget.contactMessageList.length}',
              style: TextStyle(
                fontSize: 14,
                color: Colors.white70,
              ),
            ),
          ],
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: Icon(
              Icons.search,
              color: Colors.white,
              size: 30,
            ),
          ),
        ],
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: ListView(
              children: [
                SizedBox(
                  height: 10,
                ),
                ListTile(
                  leading: CircleAvatar(
                    radius: 35,
                    backgroundColor: notificationBadgeColor,
                    child: Icon(
                      Icons.person_add,
                      color: scaffoldBgColor,
                    ),
                  ),
                  title: Text(
                    'New Group',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                ListTile(
                  leading: CircleAvatar(
                    radius: 35,
                    backgroundColor: notificationBadgeColor,
                    child: Icon(
                      Icons.person_add,
                      color: scaffoldBgColor,
                    ),
                  ),
                  title: Text(
                    'New Contact',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  trailing: Icon(
                    Icons.sick,
                  ),
                ),
                Card(
                  color: scaffoldBgColor,
                  elevation: 0.0,
                  child: ListView.builder(
                    shrinkWrap: true,
                    primary: false,
                    itemCount: widget.contactMessageList.length,
                    itemBuilder: (ctx, index) => GestureDetector(
                      onTap: () {
                        Navigator.of(context).pushReplacement(
                          MaterialPageRoute(
                            builder: (context) => ChatScreen(
                              myIndex: index,
                              list: widget.contactMessageList,
                              peerAvatar:
                                  widget.contactMessageList[index].image,
                              peerId: widget.contactMessageList[index].uid,
                              users: widget.contactMessageList[index].name,
                            ),
                          ),
                        );
                      },
                      child: ChatItem(
                        image: widget.contactMessageList[index].image==null?NetworkImage(
                          widget.contactMessageList[index].image??''
                        ):AssetImage('assets/profile_default.png'),
                        title: widget.contactMessageList[index].name,
                        divider: Container(),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
