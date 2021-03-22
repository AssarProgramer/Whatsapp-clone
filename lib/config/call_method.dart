import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:whatsapp_clone/model/user.dart';
import '../model/call_user.dart';

class CallMethods {
  final CollectionReference callCollection =
      FirebaseFirestore.instance.collection("call");
  final CollectionReference callLogCollection =
      FirebaseFirestore.instance.collection("call_log");
  String callUid;
  void getCall({String myCallUser}) {
    callUid = myCallUser;
  }

  Future<User> getCurrentUser() async {
    User currentUser;
    currentUser = FirebaseAuth.instance.currentUser;
    return currentUser;
  }

  static final CollectionReference _userCollection =
      FirebaseFirestore.instance.collection("users");
  Stream<DocumentSnapshot> callStream({String uid}) =>
      callCollection.doc(uid).snapshots();

  Future<Users> getUserDetails() async {
    User currentUser = await getCurrentUser();

    DocumentSnapshot documentSnapshot =
        await _userCollection.doc(currentUser.uid).get();

    return Users.fromMap(documentSnapshot.data());
  }

  Future<bool> makeCall({CallUser call}) async {
    try {
      call.hasDialled = true;
      Map<String, dynamic> hasDialledMap = call.toMap(call);

      call.hasDialled = false;
      Map<String, dynamic> hasNotDialledMap = call.toMap(call);

      await callCollection.doc(call.callerId).set(hasDialledMap);
      await callCollection.doc(call.receiverId).set(hasNotDialledMap);
      await callLogCollection.doc(call.callerId).set(hasDialledMap);
      await callLogCollection.doc(call.receiverId).set(hasNotDialledMap);
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<bool> endCall({CallUser call}) async {
    try {
      await callCollection.doc(call.callerId).delete();
      await callCollection.doc(call.receiverId).delete();
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }
}
