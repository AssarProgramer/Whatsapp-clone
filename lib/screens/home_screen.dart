import 'dart:async';
import 'dart:convert';
import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_contact/contacts.dart';
import 'package:flutter_contact/contact.dart';
import 'package:provider/provider.dart';
import 'package:whatsapp_clone/chat/chat.dart';
import 'package:whatsapp_clone/config/colors.dart';
import 'package:whatsapp_clone/config/user_provider.dart';
import 'package:whatsapp_clone/model/call_user.dart';
import 'package:whatsapp_clone/model/currentUser.dart';
import 'package:whatsapp_clone/pages/contacts_page.dart';
import 'package:whatsapp_clone/tabs_pages/call_log_tap.dart';
import '../tabs_pages/chat_page_tap.dart';
import '../tabs_pages/status_tab_page.dart';
import '../model/contact_model.dart';
import 'package:permission_handler/permission_handler.dart';
import '../camera/page/camera_tab_page.dart';
import '../setting_pages/settings_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatefulWidget {
  final initialIndex;
  final source;
  final userImageURl;
  HomeScreen({this.initialIndex, this.userImageURl, this.source});
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  TabController _tabController;
  @override
  User currectUser = FirebaseAuth.instance.currentUser;

  List<ContactModel> contactMessageList = [];
  CurrentUser currentUser;

  Future<void> getUsers() {
    FirebaseFirestore.instance
        .collection('users')
        .doc((FirebaseAuth.instance.currentUser).uid)
        .get()
        .then(
          (value) => {
            setState(() {
              currentUser = CurrentUser(
                currentUserStatus: value.data()['status'],
                currrentUserImage: value.data()['photoUrl'],
                currrentUserTime: value.data()['statusTime'],
                currentUserStatusType: value.data()['type'],
                currentUserStatusColors: value.data()['statusColors'],
                currentUserStatusFonts: value.data()['statusFonts'],
                currentUserStatusTexts: value.data()['statusTexts'],
                currentUserName: value.data()['nickname'],
                currentUserNumber: value.data()['userNumber'],
              );
            }),
          },
        );
  }

  List<CallUser> callLogList = [];
  CallUser callUser;

  getCallLog() async {
    QuerySnapshot querySnapShot =
        await FirebaseFirestore.instance.collection('call_log').get();
    querySnapShot.docs.forEach(
      (value) {
        setState(
          () {
            callUser = CallUser(
              receiverPic: value.data()['receiver_pic'],
              callerName: value.data()['caller_name'],
              receiverId: value.data()['receiver_id'],
              callerPic: value.data()['caller_pic'],
              hasDialled: value.data()['has_dialled'],
              callerId: value.data()['caller_id'],
              receiverName: value.data()['receiver_name'],
              channelId: value.data()['channel_id'],
              isAudio: value.data()['isAudio'],
            );
            callLogList.add(callUser);
          },
        );
      },
    );
  }

  getPermissions() async {
    if (await Permission.contacts.request().isGranted) {
      getAllContacts();
    }
  }

  getAllContacts() async {
    ContactModel contactModel;

    // //  List<Contact> _contacts = (await ContactsService.getContacts()).toList();
    await Contacts.streamContacts().forEach((contact) async {
      contact.phones.forEach((contactsDataNumber) async {
        QuerySnapshot querySnapShot =
            await FirebaseFirestore.instance.collection("users").get();
        querySnapShot.docs.forEach((querySnapShotData) {
          var mycontact = contactsDataNumber.value.split(" ").join("");

          if (querySnapShotData.data()["userNumber"] == null) {
            return Container();
          } else if (querySnapShotData.data()["userNumber"] ==
              currectUser.phoneNumber) {
            return Container();
          } else if (mycontact == querySnapShotData.data()["userNumber"]) {
            setState(() {
              contactModel = ContactModel(
                image: querySnapShotData.data()["photoUrl"],
                name: querySnapShotData.data()["nickname"],
                uid: querySnapShotData.data()["id"],
                status: querySnapShotData.data()["status"],
                type: querySnapShotData.data()["type"],
                statusTime: querySnapShotData.data()["statusTime"],
                statusColors: querySnapShotData.data()['statusColors'],
                statusFonts: querySnapShotData.data()['statusFonts'],
                statusTexts: querySnapShotData.data()['statusTexts'],
                message: "Hey! I Am Using Pak1",
              );

              contactMessageList.add(contactModel);
            });
          }
        });
      });
    });
  }

  void initState() {
    getUsers();
    getCallLog();
    _tabController = TabController(
      length: 4,
      vsync: this,
      initialIndex: widget.initialIndex,
    );

    Timer.periodic(Duration(hours: 24), (Timer t) {
      FirebaseFirestore.instance
          .collection('users')
          .doc(currectUser.uid)
          .update({
        'status': '',
        'statusTexts': '',
      });
    });
    getPermissions();
    super.initState();
  }

  void _selectOption(int value) {
    switch (value) {
      case 1:
        // Application.router.navigateTo(
        //   context,
        //   //Routes.newChatGroup,
        //   Routes.newGroup,
        //   transition: TransitionType.inFromRight,
        // );
        // Navigator.of(context).push(
        //   MaterialPageRoute(
        //     builder: (ctx) => NewGroup(),
        //   ),
        // );
        //   break;
        // case 2:
        //   Navigator.of(context).push(
        //     MaterialPageRoute(
        //       builder: (ctx) => NewBroadCast(),
        //     ),
        //   );
        break;
      // case 3:
      //   Navigator.of(context).push(
      //     MaterialPageRoute(
      //       builder: (ctx) => WhatsappWebScreen(),
      //     ),
      //   );
      //   break;
      // case 4:
      // Navigator.of(context).push(
      //   MaterialPageRoute(
      //     builder: (ctx) => StarredMessagesScreen(),
      //   ),
      // );

      // break;
      case 5:
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (ctx) => SettingsScreen(currentUser: currentUser),
          ),
        );
        break;
        // case 6:
        //   Navigator.of(context).push(
        //     MaterialPageRoute(
        //       builder: (ctx) => FutureTodoScreen(),
        //     ),
        //   );
        break;
      case 7:
        break;
    }
  }

  List<PopupMenuItem<int>> chat = [
    PopupMenuItem(value: 1, child: Text("New group")),
    PopupMenuItem(value: 2, child: Text("New broadcast")),
    PopupMenuItem(value: 3, child: Text("WhatzApp Web")),
    PopupMenuItem(value: 4, child: Text("Starred messages")),
    PopupMenuItem(value: 5, child: Text("Settings")),
  ];
  List<PopupMenuItem<int>> status = [
    PopupMenuItem(value: 6, child: Text("Status privacy")),
    PopupMenuItem(value: 5, child: Text("Settings")),
  ];
  List<PopupMenuItem<int>> call = [
    PopupMenuItem(value: 7, child: Text("Clear call log")),
    PopupMenuItem(value: 5, child: Text("Settings")),
  ];
  int pageValue = 1;
  Widget myPopMenu() {
    return PopupMenuButton(
        onSelected: _selectOption,
        itemBuilder: (context) {
          if (pageValue == 1) {
            return chat;
          } else if (pageValue == 2) {
            return status;
          } else {
            return call;
          }
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: darkColor,
        title: InkWell(
          onTap: () {
            FirebaseAuth.instance.signOut();
          },
          child: Text("Pak 1"),
        ),
        actions: [
          myPopMenu(),
        ],
        bottom: TabBar(
          unselectedLabelColor: Colors.white,
          labelColor: Colors.white,
          tabs: [
            Tab(icon: Icon(Icons.camera_alt)),
            Tab(
              icon: Text('CHATS'),
            ),
            Tab(
              icon: Text('STATUS'),
            ),
            Tab(
              icon: Text('CALLS'),
            ),
          ],
          controller: _tabController,
          indicatorColor: Colors.white,
          indicatorSize: TabBarIndicatorSize.tab,
        ),
        bottomOpacity: 1,
      ),
      body: TabBarView(
        children: [
          CameraPageTab(),
          // userLists(),
          ChatPageTab(
            contactMessageList,
          ),
          StatusTabPage(contactMessageList, widget.source, currentUser),
          CallLog(callLogList),
        ],
        controller: _tabController,
      ),
    );
  }
}
