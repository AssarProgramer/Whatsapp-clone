import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
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
  Widget buildItem(BuildContext context, var document, int index) {
    if (widget.contactMessageList[index].uid == currectUser.uid) {
      return Container();
    } else {
      return Container(
        child: FlatButton(
          child: Row(
            children: <Widget>[
              Material(
                color: Colors.grey,
                child: widget.contactMessageList[index].image != null
                    ? CachedNetworkImage(
                        placeholder: (context, url) => Container(
                          child: CircularProgressIndicator(
                            strokeWidth: 1.0,
                          ),
                          width: 50.0,
                          height: 50.0,
                          padding: EdgeInsets.all(15.0),
                        ),
                        imageUrl: widget.contactMessageList[index].image,
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
                          widget.contactMessageList[index].name,
                        ),
                        alignment: Alignment.centerLeft,
                        margin: EdgeInsets.fromLTRB(10.0, 0.0, 0.0, 5.0),
                      ),
                      Container(
                        child: Text(
                          widget.contactMessageList[index].message,
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
                  peerId:  document[index].uid,
                  peerAvatar: document[index].image,
                  users: document[index].name,
                  list: widget.contactMessageList,
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
    return userProviders.getContactList == null
        ? Center(
            child: Text("No One Found"),
          )
        : Card(
            color: scaffoldBgColor,
            elevation: 0.0,
            child: ListView.builder(
                shrinkWrap: true,
                primary: false,
                itemCount: userProviders.getContactList.length,
                itemBuilder: (ctx, index) => buildItem(context,
                    userProviders.getContactList, userProviders.getIndex)),
          );
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
