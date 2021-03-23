import 'dart:async';
import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:whatsapp_clone/chat/chat.dart';
import 'package:whatsapp_clone/config/colors.dart';
import 'package:whatsapp_clone/config/user_provider.dart';
import 'package:whatsapp_clone/model/contact_model.dart';
import 'package:whatsapp_clone/model/currentUser.dart';
import '../widgets/chat_item.dart';
import 'package:provider/provider.dart';
import '../pages/contacts_page.dart';

class ChatPageTab extends StatefulWidget {
  final List<ContactModel> contactMessageList;
  ChatPageTab(this.contactMessageList);
  @override
  _ChatPageTabState createState() => _ChatPageTabState();
}

class _ChatPageTabState extends State<ChatPageTab> {
  UserProvider userProviders;
  User currectUser = FirebaseAuth.instance.currentUser;
  bool isSees = false;
  List<ContactModel> chatList;
  int myIndex;
  Widget buildItem(BuildContext context, var document, int index) {
    if (chatList[index].uid == currectUser.uid) {
      return Container();
    } else {
      return Container(
        child: FlatButton(
          child: Row(
            children: <Widget>[
              Material(
                color: Colors.grey,
                child: chatList[index].image != null
                    ? CachedNetworkImage(
                        placeholder: (context, url) => Container(
                          child: CircularProgressIndicator(
                            strokeWidth: 1.0,
                          ),
                          width: 50.0,
                          height: 50.0,
                          padding: EdgeInsets.all(15.0),
                        ),
                        imageUrl: chatList[index].image,
                        width: 50.0,
                        height: 50.0,
                        fit: BoxFit.cover,
                      )
                    : Image.network(
                        'https://www.uoh.cl/assets/img/no_img.jpg',
                        fit: BoxFit.cover,
                      ),
                borderRadius: BorderRadius.all(Radius.circular(25.0)),
                clipBehavior: Clip.hardEdge,
              ),
              Flexible(
                child: Container(
                  child: Column(
                    children: <Widget>[
                      Container(
                        child: Text(
                          chatList[index].name,
                        ),
                        alignment: Alignment.centerLeft,
                        margin: EdgeInsets.fromLTRB(10.0, 0.0, 0.0, 5.0),
                      ),
                      Container(
                        child: Text(
                          chatList[index].message,
                        ),
                        alignment: Alignment.centerLeft,
                        margin: EdgeInsets.fromLTRB(10.0, 0.0, 0.0, 0.0),
                      )
                    ],
                  ),
                  margin: EdgeInsets.only(left: 20.0),
                ),
              ),
            ],
          ),
          onPressed: () {
            setState(() {
              isSees = true;
            });
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ChatScreen(
                  isSees: true,
                  peerId: document[index].uid,
                  peerAvatar: document[index].image,
                  users: document[index].name,
                  list: chatList,
                ),
              ),
            );
          },
          padding: EdgeInsets.fromLTRB(25.0, 10.0, 25.0, 10.0),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
        ),
        margin: EdgeInsets.only(bottom: 10.0, left: 5.0, right: 5.0),
      );
    }
  }

  Widget userLists() {
    if (chatList == null) {
      return Center(
        child: Text("No One Found"),
      );
    } else if (myIndex == null) {
      print("Oh-------------------");

      return Container();
    } else if (chatList != null) {
      print("No-------------------");

      return Card(
        color: scaffoldBgColor,
        elevation: 0.0,
        child: ListView.builder(
          shrinkWrap: true,
          primary: false,
          itemCount: chatList.length,
          itemBuilder: (ctx, index) => buildItem(context, chatList, myIndex),
        ),
      );
    }
    return Container();
  }

  @override
  void initState() {
    getContact();
    super.initState();
  }

  static List<ContactModel> decode(String musics) =>
      (json.decode(musics) as List<dynamic>)
          .map<ContactModel>((item) => ContactModel.fromJson(item))
          .toList();

  void getContact() async {
    print("Yesssss");
    SharedPreferences prefs = await SharedPreferences.getInstance();

    setState(() {
      String contact = prefs.getString(
        "contactList",
      );
      myIndex = prefs.getInt("index");
      chatList = decode(contact);
    });
  }

  @override
  Widget build(BuildContext context) {
    userProviders = Provider.of<UserProvider>(context);
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: darkColor,
        child: Icon(Icons.comment),
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => ContactsPage(widget.contactMessageList),
            ),
          );
        },
      ),
      body: userLists(),
    );
  }
}
