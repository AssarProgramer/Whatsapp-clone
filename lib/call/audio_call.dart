import 'dart:async';

import 'package:agora_rtc_engine/rtc_engine.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:whatsapp_clone/chat/const.dart';
import 'package:whatsapp_clone/config/colors.dart';
import '../utils/settings.dart';
import '../config/call_method.dart';
import 'package:flutter/scheduler.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../config/user_provider.dart';
import '../model/call_user.dart';
import 'package:provider/provider.dart';

class AudioCall extends StatefulWidget {
  final CallUser call;
  AudioCall({this.call});
  @override
  _AudioCallState createState() => _AudioCallState();
}

class _AudioCallState extends State<AudioCall> {
  bool joined = false;
  int remoteUid = null;
  bool switchs = false;
  bool isSpeaker = false;
  @override
  void initState() {
    super.initState();

    initPlatformState();
  }

  // Initialize the app
  Future<void> initPlatformState() async {
    // Get microphone permission
    Permission.microphone.isGranted;

    // Create RTC client instance
    var engine = await RtcEngine.create(APP_ID);
    // Define event handler
    engine.setEventHandler(RtcEngineEventHandler(
        joinChannelSuccess: (String channel, int uid, int elapsed) {
      setState(() {
        joined = true;
      });
    }, userJoined: (int uid, int elapsed) {
      print('userJoined $uid');
      setState(() {
        remoteUid = uid;
      });
    }, userOffline: (int uid, UserOfflineReason reason) {
      print('userOffline $uid');
      setState(() {
        remoteUid = null;
      });
    }));
    // Join channel 123
    engine.disableVideo();
    await engine.joinChannel(Token, widget.call.channelId, null, 0);
  }

  void _onToggleMute() async {
    var engine = await RtcEngine.create(APP_ID);
    setState(() {
      muted = !muted;
    });
    engine.muteLocalAudioStream(muted);
  }

  final CallMethods callMethods = CallMethods();
  UserProvider userProvider;
  StreamSubscription callStreamSubscription;
  addPostFrameCallback() {
    SchedulerBinding.instance.addPostFrameCallback((_) {
      userProvider = Provider.of<UserProvider>(context, listen: false);
      callStreamSubscription = callMethods
          .callStream(uid: userProvider.getUser.uid)
          .listen((DocumentSnapshot ds) {
        // defining the logic
        switch (ds.data) {
          case null:
            Navigator.pop(context);
            break;

          default:
            break;
        }
      });
    });
  }

  bool muted = false;
  void _onCallEnd(BuildContext context) async {
    var engine = await RtcEngine.create(APP_ID);
    await callMethods.endCall(call: widget.call);

    engine.leaveChannel();
    Navigator.pop(context);
  }

  // Create a simple chat UI
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: darkColor,
        toolbarHeight: 140,
        centerTitle: true,
        title: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.lock,
                  color: highlightColor,
                ),
                Text(
                  'End-to- encrypted',
                  style: TextStyle(color: highlightColor, fontSize: 17),
                ),
              ],
            ),
            SizedBox(
              height: 12.0,
            ),
            Text(
              widget.call.hasDialled == true
                  ? widget.call.receiverName
                  : widget.call.callerName,
              style: TextStyle(color: Colors.white60, fontSize: 19),
            ),
            SizedBox(  
              height: 12.0,
            ),
            Text(
              "Calling",
              style: TextStyle(color: highlightColor, fontSize: 17),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        height: 80,
        color: darkColor,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              onPressed: () {},
              icon: Icon(
                isSpeaker == false ? Icons.volume_down : Icons.volume_up,
                color: Colors.white60,
              ),
            ),
            Icon(
              Icons.videocam,
              color: Colors.white38,
            ),
            IconButton(
              onPressed: _onToggleMute,
              icon: Icon(
                muted ? Icons.mic_off : Icons.mic,
                color: Colors.white60,
              ),
            ),
          ],
        ),
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
              fit: BoxFit.cover,
              image: widget.call.receiverPic == null
                  ? AssetImage("assets/loading.png")
                  : NetworkImage(widget.call.receiverPic)),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            RawMaterialButton(
              onPressed: () => _onCallEnd(context),
              child: Icon(
                Icons.call_end,
                color: Colors.white,
                size: 35.0,
              ),
              shape: CircleBorder(),
              elevation: 2.0,
              fillColor: Colors.redAccent,
              padding: const EdgeInsets.all(15.0),
            ),
            SizedBox(
              height: 20.0,
            ),
          ],
        ),
      ),
    );
  }
}
