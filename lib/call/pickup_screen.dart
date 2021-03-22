import 'package:flutter/material.dart';
import 'package:whatsapp_clone/call/audio_call.dart';
import 'package:whatsapp_clone/config/colors.dart';
import 'package:whatsapp_clone/utils/permissions.dart';
import '../model/call_user.dart';
import '../config/call_method.dart';
import './cal_screen.dart';
import '../widgets/cached_image.dart';

class PickupScreen extends StatelessWidget {
  final CallUser call;

  final CallMethods callMethods = CallMethods();

  PickupScreen({
    @required this.call,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: darkColor,
        toolbarHeight: 140,
        centerTitle: true,
        title: Column(
          children: [
            Text(
              call.hasDialled == true ? call.receiverName : call.callerName,
              style: TextStyle(color: Colors.white60, fontSize: 19),
            ),
            SizedBox(
              height: 12.0,
            ),
            Text(
              "Incoming",
              style: TextStyle(color: highlightColor, fontSize: 17),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        height: 80,
        color: primaryColor,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            RawMaterialButton(
              onPressed: () async {
                await callMethods.endCall(call: call);
              },
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
            RawMaterialButton(
              onPressed: () async {
                await Permissions.cameraAndMicrophonePermissionsGranted()
                    ? Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => call.isAudio == false
                              ? CallScreen(call: call)
                              : AudioCall(
                                  call: call,
                                ),
                        ),
                      )
                    : Container();
              },
              child: Icon(
                Icons.call,
                color: Colors.white,
                size: 35.0,
              ),
              shape: CircleBorder(),
              elevation: 2.0,
              fillColor: Colors.green,
              padding: const EdgeInsets.all(15.0),
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
              image: call.receiverPic == null
                  ? AssetImage("assets/loading.png")
                  : NetworkImage(call.receiverPic)),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [],
        ),
      ),
      // body: Container(
      //   alignment: Alignment.center,
      //   padding: EdgeInsets.symmetric(vertical: 100),
      //   child: Column(
      //     mainAxisAlignment: MainAxisAlignment.center,
      //     children: <Widget>[
      //       Text(
      //         "Incoming...",
      //         style: TextStyle(
      //           fontSize: 30,
      //         ),
      //       ),
      //       SizedBox(height: 50),
      //       CachedImage(
      //         call.callerPic,
      //         isRound: true,
      //         radius: 180,
      //       ),
      //       SizedBox(height: 15),
      //       Text(
      //         call.callerName,
      //         style: TextStyle(
      //           fontWeight: FontWeight.bold,
      //           fontSize: 20,
      //         ),
      //       ),
      //       SizedBox(height: 75),
      //       Row(
      //         mainAxisAlignment: MainAxisAlignment.center,
      //         children: <Widget>[
      //           IconButton(
      //             icon: Icon(Icons.call_end),
      //             color: Colors.redAccent,
      //             onPressed: () async {
      //               await callMethods.endCall(call: call);
      //             },
      //           ),
      //           SizedBox(width: 25),
      //           IconButton(
      //             icon: Icon(Icons.call),
      //             color: Colors.green,
      //             onPressed: () async =>
      //                 await Permissions.cameraAndMicrophonePermissionsGranted()
      //                     ? Navigator.push(
      //                         context,
      //                         MaterialPageRoute(
      //                           builder: (context) => call.isAudio == false
      //                               ? CallScreen(call: call)
      //                               : AudioCall(
      //                                   call: call,
      //                                 ),
      //                         ),
      //                       )
      //                     : {},
      //           ),
      //         ],
      //       ),
      //     ],
      //   ),
      // ),
    );
  }
}
