import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:whatsapp_clone/model/contact_model.dart';
import 'package:whatsapp_clone/model/user.dart';
import './call_method.dart';

class UserProvider with ChangeNotifier {
 
  List<ContactModel> contactMessageList;
  void getContactMessageList(List<ContactModel> contactList) {
    contactMessageList = contactList;
    notifyListeners();
  }

  int myIndex;
  void getContactMessageListIndex(int index) {
    myIndex = index;
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
