import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:whatsapp_clone/camera/page/camera_tab_page.dart';
import 'package:whatsapp_clone/config/colors.dart';
import 'package:whatsapp_clone/model/contact_model.dart';
import 'package:whatsapp_clone/model/currentUser.dart';
import 'package:whatsapp_clone/screens/home_screen.dart';
import 'package:whatsapp_clone/widgets/chat_item.dart';
import '../widgets/my_status.dart';
import '../pages/view_status.dart';
import '../pages/edit_status.dart';

final getDatas = FirebaseFirestore.instance.collection('users');

class StatusTabPage extends StatefulWidget {
   CurrentUser currentUser;

  final List<ContactModel> contactMessageList;
  final source;
  StatusTabPage(this.contactMessageList, this.source,this.currentUser);

  @override
  _StatusTabPageState createState() => _StatusTabPageState();
}

class _StatusTabPageState extends State<StatusTabPage> {
  // var currentUserStatus;
  // var currrentUserImage;
  // var currrentUserTime;
  // var currentUserStatusType;
  // var currentUserStatusColors;
  // var currentUserStatusFonts;
  // var currentUserStatusTexts;


  // Future<void> getUsers() {
  //   FirebaseFirestore.instance
  //       .collection('users')
  //       .doc((FirebaseAuth.instance.currentUser).uid)
  //       .get()
  //       .then(
  //         (value) => {
  //           setState(() {
  //             currentUserStatus = value.data()['status'];
  //             currrentUserImage = value.data()['photoUrl'];
  //             currrentUserTime = value.data()['statusTime'];
  //             currentUserStatusType = value.data()['type'];
  //             currentUserStatusColors = value.data()['statusColors'];
  //             currentUserStatusFonts = value.data()['statusFonts'];
  //             currentUserStatusTexts = value.data()['statusTexts'];
  //           }),
  //         },
  //       );
  // }

  @override
  void initState() {
    super.initState();
    // getUsers();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
             heroTag: 'herp',
            onPressed: () {
              Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => EditStatus()));
            },
            child: Icon(
              Icons.edit,
              color: Colors.black54,
            ),
            backgroundColor: Colors.grey[300],
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            width: 65,
            height: 65,
            child: FloatingActionButton(
              backgroundColor: fabBgColor,
              onPressed: () {
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (context) => HomeScreen(
                          initialIndex: 0,
                        )));
              },
              child: Icon(Icons.camera_alt),
            ),
          ),
        ],
      ),
      body: ListView(
        children: [
          MyStatus(
            time: widget.currentUser.currrentUserTime,
            image: widget.currentUser.currrentUserImage == null
                ? NetworkImage(widget.currentUser.currrentUserImage??'')
                : AssetImage('assets/profile_default.png'),
            child: widget.currentUser.currentUserStatusTexts == '' &&  widget.currentUser.currentUserStatusTexts == ''
                ? CircleAvatar(
                    radius: 12,
                    backgroundColor: fabBgColor,
                    child: Icon(
                      Icons.add,
                      color: Colors.white,
                    ),
                  )
                : CircleAvatar(
                    radius: 12,
                    backgroundColor: Colors.transparent,
                  ),
            onTap: () {
               widget.currentUser.currentUserStatus == '' &&  widget.currentUser.currentUserStatusTexts == ''
                  ? Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                        builder: (context) => HomeScreen(
                          initialIndex: 0,
                        ),
                      ),
                    )
                  : Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (contact) => ViewStatus(
                          source:  widget.currentUser.currentUserStatusType,
                          resource:  widget.currentUser.currentUserStatus,
                          colors:  widget.currentUser.currentUserStatusColors,
                          fonts:  widget.currentUser.currentUserStatusFonts,
                          taxts:  widget.currentUser.currentUserStatusTexts,
                        ),
                      ),
                    );
            },
          ),
          Container(
            padding: EdgeInsets.only(left: 10),
            color: Color(0xfff4f4f4),
            height: 50,
            width: double.infinity,
            child: Row(
              children: [
                Text('Viewed updates'),
              ],
            ),
          ),
          Container(
            height: 500,
            width: 300,
            child: ListView.builder(
              itemCount: widget.contactMessageList.length,
              itemBuilder: (contact, index) {
                return widget.contactMessageList[index].status == "" &&
                        widget.contactMessageList[index].statusTexts == ''
                    ? Container()
                    : ChatItem(
                        time: widget.contactMessageList[index].statusTime,
                        title: widget.contactMessageList[index].name,
                        image: widget.contactMessageList[index].image == null
                            ? NetworkImage(
                                widget.contactMessageList[index].image ?? '')
                            : AssetImage(
                                'assets/profile_default.png',
                              ),
                        divider: Divider(
                          color: Colors.grey,
                          indent: 80,
                        ),
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (contact) => ViewStatus(
                                source: widget.contactMessageList[index].type,
                                resource:
                                    widget.contactMessageList[index].status,
                                colors: widget
                                    .contactMessageList[index].statusColors,
                                fonts: widget
                                    .contactMessageList[index].statusFonts,
                                taxts: widget
                                    .contactMessageList[index].statusTexts,
                              ),
                            ),
                          );
                        },
                      );
              },
            ),
          ),
        ],
      ),
    );
  }
}
