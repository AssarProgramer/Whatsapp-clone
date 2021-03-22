import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:whatsapp_clone/camera/model/media_source.dart';
import 'package:whatsapp_clone/camera/page/source_page.dart';
import 'package:whatsapp_clone/camera/widget/video_widget.dart';
import 'package:whatsapp_clone/screens/home_screen.dart';

class CameraPageTab extends StatefulWidget {
  @override
  _CameraPageTabState createState() => _CameraPageTabState();
}

class _CameraPageTabState extends State<CameraPageTab> {
  File fileMedia;
  MediaSource source;
  var userImageURl;
  User currentUsers = FirebaseAuth.instance.currentUser;

  void _uploadImage(var fileImage) {
    String imageFileName = DateTime.now().microsecondsSinceEpoch.toString();
    final Reference storageReference =
        FirebaseStorage.instance.ref().child('status').child(imageFileName);
    final UploadTask uploadTask = storageReference.putFile(fileImage);
    uploadTask
        .then(
      (TaskSnapshot taskSnapshot) => {
        taskSnapshot.ref.getDownloadURL().then(
              (imageUrl) => {
                userImageURl = imageUrl,
                source == MediaSource.image
                    ? FirebaseFirestore.instance
                        .collection('users')
                        .doc(currentUsers.uid)
                        .update({
                        'status': userImageURl == null ? '' : userImageURl,
                        'type': 'image',
                        'statusTime':
                            DateTime.now().millisecondsSinceEpoch.toString(),
                      })
                    : FirebaseFirestore.instance
                        .collection('users')
                        .doc(currentUsers.uid)
                        .update({
                        'status': userImageURl == null ? '' : userImageURl,
                        'type': 'video',
                        'statusTime':
                            DateTime.now().millisecondsSinceEpoch.toString(),
                      }),
              },
            ),
      },
    )
        .catchError(
      (onError) {
        Fluttertoast.showToast(
          msg: onError.toString(),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.green,
        onPressed: () async {
          _uploadImage(fileMedia);

          await Navigator.of(context).pushReplacement(
            MaterialPageRoute(
                builder: (context) => HomeScreen(
                    initialIndex: 2, userImageURl: fileMedia, source: source)),
          );
        },
        child: Icon(
          Icons.send,
        ),
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(32),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Expanded(
                child: fileMedia == null
                    ? Icon(Icons.photo, size: 120)
                    : (source == MediaSource.image
                        ? Image.file(fileMedia)
                        : VideoWidget(fileMedia)),
              ),
              const SizedBox(height: 24),
              RaisedButton(
                child: Text('Capture Image'),
                shape: StadiumBorder(),
                onPressed: () => capture(MediaSource.image),
                color: Theme.of(context).primaryColor,
                textColor: Colors.white,
              ),
              const SizedBox(height: 12),
              RaisedButton(
                child: Text('Capture Video'),
                shape: StadiumBorder(),
                onPressed: () => capture(MediaSource.video),
                color: Theme.of(context).primaryColor,
                textColor: Colors.white,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future capture(MediaSource source) async {
    setState(() {
      this.source = source;
      this.fileMedia = null;
    });

    final result = await Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => SourcePage(),
        settings: RouteSettings(
          arguments: source,
        ),
      ),
    );

    if (result == null) {
      return;
    } else {
      setState(() {
        fileMedia = result;
      });
    }
  }
}
