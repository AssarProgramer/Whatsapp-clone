import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../screens/home_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:async';

class SaveImageVideo extends StatefulWidget {
   var imgPath;

  SaveImageVideo({
    this.imgPath,
  });

  @override
  _SaveImageVideoState createState() => _SaveImageVideoState();
}

class _SaveImageVideoState extends State<SaveImageVideo> {
  @override
  Widget build(BuildContext context) {
    var userImageURl;

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

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.green,
        onPressed: () async {
           _uploadImage(
            widget.imgPath
          );

          await Navigator.of(context).pushReplacement(
            MaterialPageRoute(
                builder: (context) => HomeScreen(
                      initialIndex: 2,
                      userImageURl:userImageURl
                    )),
          );
        },
        child: Icon(
          Icons.check,
        ),
      ),
      appBar: AppBar(
        automaticallyImplyLeading: true,
      ),
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
              flex: 2,
              child: Image.file(
                File(widget.imgPath),
                fit: BoxFit.cover,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
