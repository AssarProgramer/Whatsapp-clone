import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:whatsapp_clone/config/colors.dart';
import '../screens/home_screen.dart';

class SetProfilePage extends StatefulWidget {
  final String phoneNumber;

  const SetProfilePage({Key key, this.phoneNumber}) : super(key: key);

  @override
  _SetProfilePageState createState() => _SetProfilePageState();
}

class _SetProfilePageState extends State<SetProfilePage> {
  TextEditingController _nameController = TextEditingController();
  User currentUser = FirebaseAuth.instance.currentUser;
  bool isLoading = false;
  User user;
  File image;
  bool isLoggedIn = false;

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  Future<void> _showMyDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: true, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                ListTile(
                  leading: Icon(Icons.camera_alt),
                  title: Text("Camera"),
                  onTap: () {
                    getImage(ImageSource.camera);
                    Navigator.of(context).pop();
                  },
                ),
                ListTile(
                  leading: Icon(Icons.photo_album),
                  title: Text("Gallary"),
                  onTap: () {
                    getImage(ImageSource.gallery);
                    Navigator.of(context).pop();
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Future<void> getImage(ImageSource source) async {
    var images = await ImagePicker().getImage(source: source);
    setState(() {
      image = File(images.path);
    });
    _uploadImage(
      image,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: isLoading == false
          ? Container(
              margin: EdgeInsets.symmetric(horizontal: 20, vertical: 40),
              child: Column(
                children: <Widget>[
                  Text(
                    "Profile Info",
                    style: TextStyle(
                      color: highlightColor,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Please provide your name and an optional Profile photo",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  _rowWidget(),
                  Expanded(
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: MaterialButton(
                        color: highlightColor,
                        onPressed: () {
                          _validator(userImageURl);
                        },
                        child: Text(
                          "Next",
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            )
          : Center(
              child: CircularProgressIndicator(backgroundColor: Colors.black),
            ),
    );
  }

  Widget _rowWidget() {
    return Container(
      child: Row(
        children: <Widget>[
          CupertinoButton(
            child: Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.all(Radius.circular(25))),
              child: image == null
                  ? Icon(Icons.camera_alt)
                  : ClipOval(
                      child: Image(
                        fit: BoxFit.cover,
                        image: FileImage(image),
                      ),
                    ),
            ),
            onPressed: () {
              showCupertinoModalPopup(
                context: context,
                builder: (BuildContext context) => CupertinoActionSheet(
                  message: const Text('your choise '),
                  actions: [
                    CupertinoActionSheetAction(
                      child: const Text('Camera'),
                      onPressed: () {
                        getImage(ImageSource.camera);
                        Navigator.of(context).pop();
                      },
                    ),
                    CupertinoActionSheetAction(
                      child: const Text('gallery'),
                      onPressed: () {
                        getImage(ImageSource.gallery);
                        Navigator.of(context).pop();
                      },
                    )
                  ],
                ),
              );
            },
          ),
          SizedBox(
            width: 8,
          ),
          Expanded(
            child: TextField(
              controller: _nameController,
              decoration: InputDecoration(
                hintText: "Enter your name",
              ),
            ),
          ),
          SizedBox(
            width: 8.0,
          ),
        ],
      ),
    );
  }

  void _validator(var url) {
    if (image == null && _nameController.text.isEmpty) {
      Fluttertoast.showToast(msg: 'Please add image & enter name');
    } else if (image == null) {
      Fluttertoast.showToast(msg: 'Please add image');
    } else if (_nameController.text.isEmpty) {
      Fluttertoast.showToast(msg: 'Please enter name');
    } else {
      this.setState(() {
        isLoading = true;
      });
      FirebaseFirestore.instance.collection('users').doc(currentUser.uid).set({
        'nickname': _nameController.text.trim(),
        'photoUrl': url == null
            ? "https://thumbs.dreamstime.com/b/default-avatar-profile-trendy-style-social-media-user-icon-187599373.jpg"
            : url,
        'id': currentUser.uid,
        'status': '',
        'createdAt': DateTime.now().millisecondsSinceEpoch.toString(),
        'chattingWith': null,
        "userNumber": widget.phoneNumber,
        'statusTexts':'',
      });
      this.setState(() {
        isLoading = false;
      });
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => HomeScreen(
            initialIndex: 1,
          ),
        ),
      );
    }
  }

  String userImageURl;

  void _uploadImage(var fileImage) {
    String imageFileName = DateTime.now().microsecondsSinceEpoch.toString();
    final Reference storageReference =
        FirebaseStorage.instance.ref().child('userImage').child(imageFileName);
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
}
