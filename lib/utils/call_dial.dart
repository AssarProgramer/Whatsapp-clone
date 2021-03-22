import 'package:flutter/material.dart';
import 'package:whatsapp_clone/call/cal_screen.dart';
import '../model/call_user.dart';
import '../model/user.dart';
import '../config/call_method.dart';

class CallUtils {
  static final CallMethods callMethods = CallMethods();

  static dial({Users from, Users to, context}) async {
    CallUser call = CallUser(
      callerId: from.uid,
      callerName: from.name,
      callerPic: from.profilePhoto,
      receiverId: to.uid,
      receiverName: to.name,
      receiverPic: to.profilePhoto,
      channelId: "PAK1",
      isAudio: false,
    );

    bool callMade = await callMethods.makeCall(call: call);

    call.hasDialled = true;

    if (callMade) {
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => CallScreen(call: call),
          ));
    }
  }
}
