import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:whatsapp_clone/model/contact_model.dart';
import 'package:whatsapp_clone/model/user.dart';
import './call_method.dart';

class UserProvider with ChangeNotifier {
  List<ContactModel> contactMessageList;
  static String encode(List<ContactModel> contactModel) => json.encode(
        contactModel
            .map<Map<String, dynamic>>((contact) => ContactModel.toMap(contact))
            .toList(),
      );
  void getContactMessageList(List<ContactModel> contactList) async {
    contactMessageList = contactList;
    SharedPreferences prefs = await SharedPreferences.getInstance();

    String contact = encode(contactMessageList);
    prefs.setString("contactList", contact);
    notifyListeners();
  }

  int myIndex;
  void getContactMessageListIndex(int index) async {
    myIndex = index;
    SharedPreferences prefs = await SharedPreferences.getInstance();

    prefs.setInt("index", myIndex);
    notifyListeners();
  }

  List<ContactModel> get getContactList {
    return contactMessageList;
  }

  int get getIndex {
    return myIndex;
  }

  Users _users;
  CallMethods _callMethods = CallMethods();

  Users get getUser => _users;

  void refreshUser() async {
    Users user = await _callMethods.getUserDetails();
    _users = user;
    notifyListeners();
  }
}
