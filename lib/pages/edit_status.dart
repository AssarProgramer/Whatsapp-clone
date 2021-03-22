import 'dart:math';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:emoji_picker/emoji_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:whatsapp_clone/config/colors.dart';
import 'package:whatsapp_clone/config/user_provider.dart';
import '../screens/home_screen.dart';

class EditStatus extends StatefulWidget {
  @override
  _EditStatusState createState() => _EditStatusState();
}

class _EditStatusState extends State<EditStatus> {
  String selectedColor;
  String selectedFont;
  Random random = Random();
  int fontIndex = 0;
  UserProvider userProvider;
  int index = 0;
  List colors = [
    Colors.blueGrey,
    Colors.red,
    Colors.blue,
    Colors.cyan,
    Colors.green,
    Colors.deepPurpleAccent,
    Colors.pink,
    Colors.indigoAccent,
    Colors.teal
  ];

  void statusColors() {
    if (index == 0) {
      setState(() {
        selectedColor = "blueGrey";
      });
    } else if (index == 1) {
      setState(() {
        selectedColor = "red";
      });
    } else if (index == 2) {
      setState(() {
        selectedColor = "blue";
      });
    } else if (index == 3) {
      setState(() {
        selectedColor = "cyan";
      });
    } else if (index == 4) {
      setState(() {
        selectedColor = "green";
      });
    } else if (index == 5) {
      setState(() {
        selectedColor = "deepPurpleAccent";
      });
    } else if (index == 6) {
      setState(() {
        selectedColor = "pink";
      });
    } else if (index == 7) {
      setState(() {
        selectedColor = "indigoAccent";
      });
    } else if (index == 8) {
      setState(() {
        selectedColor = "teal";
      });
    }
  }

  List styles = [
    GoogleFonts.lato(
      color: Colors.white,
      fontSize: 40,
    ),
    GoogleFonts.zcoolXiaoWei(
      color: Colors.white,
      fontSize: 40,
    ),
    GoogleFonts.zeyada(
      fontSize: 40,
      color: Colors.white,
    ),
    GoogleFonts.trocchi(
      fontSize: 40,
      color: Colors.white,
    ),
    GoogleFonts.tomorrow(
      fontSize: 40,
      color: Colors.white,
    ),
    GoogleFonts.tinos(
      fontSize: 40,
      color: Colors.white,
    ),
    GoogleFonts.stintUltraExpanded(
      fontSize: 40,
      color: Colors.white,
    ),
    GoogleFonts.sriracha(
      fontSize: 40,
      color: Colors.white,
    ),
    GoogleFonts.signikaNegative(
      fontSize: 40,
      color: Colors.white,
    ),
  ];
  void statusFont() {
    if (fontIndex == 0) {
      setState(() {
        selectedFont = "lato";
      });
    } else if (fontIndex == 1) {
      setState(() {
        selectedFont = "zcoolXiaoWei";
      });
    } else if (fontIndex == 2) {
      setState(() {
        selectedFont = "zeyada";
      });
    } else if (fontIndex == 3) {
      setState(() {
        selectedFont = "trocchi";
      });
    } else if (fontIndex == 4) {
      setState(() {
        selectedFont = "tomorrow";
      });
    } else if (fontIndex == 5) {
      setState(() {
        selectedFont = "tinos";
      });
    } else if (fontIndex == 6) {
      setState(() {
        selectedFont = "stintUltraExpanded";
      });
    } else if (fontIndex == 7) {
      setState(() {
        selectedFont = "sriracha";
      });
    } else if (fontIndex == 8) {
      setState(() {
        selectedFont = "signikaNegative";
      });
    }
  }

  void changeIndex() {
    setState(() {
      index = random.nextInt(9);
    });
  }

  void changeStyleIndex() {
    setState(() {
      fontIndex = random.nextInt(9);
    });
  }

  User currentUsers = FirebaseAuth.instance.currentUser;
  TextEditingController text = TextEditingController();

  void updatedata() {
    if (text == null) {}
    FirebaseFirestore.instance
        .collection('users')
        .doc(currentUsers.uid)
        .update({
      'statusTexts': text.text,
      'statusColors': selectedColor,
      'statusFonts': selectedFont,
      'statusTime': DateTime.now().millisecondsSinceEpoch.toString(),
    });
  }

  String onChnage;
  bool show = false;
  final FocusNode focusNode = FocusNode();
  @override
  void initState() {
    focusNode.addListener(() {
      if (focusNode.hasFocus) {
        setState(() {
          show = false;
        });
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(left: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: 150,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      IconButton(
                        onPressed: () {
                          focusNode.unfocus();
                          focusNode.canRequestFocus;
                          setState(() {
                            show = !show;
                          });
                        },
                        icon: Icon(Icons.emoji_emotions,
                            size: 35, color: Colors.white70),
                      ),
                      IconButton(
                        icon: Text(
                          'T',
                          style: TextStyle(
                            fontSize: 40,
                            color: Colors.white70,
                          ),
                        ),
                        onPressed: changeStyleIndex,
                      ),
                      IconButton(
                        onPressed: changeIndex,
                        icon: Icon(
                          Icons.track_changes_sharp,
                          size: 35,
                          color: Colors.white70,
                        ),
                      ),
                    ],
                  ),
                ),
                FloatingActionButton(
                  onPressed: () async {
                    statusColors();
                    statusFont();
                    updatedata();
                    await Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                        builder: (contect) => HomeScreen(
                          initialIndex: 1,
                        ),
                      ),
                    );
                  },
                  child: Icon(
                    Icons.send,
                    color: Colors.white,
                  ),
                  backgroundColor: darkColor,
                ),
              ],
            ),
            show ? emojiSelect() : Container(),
          ],
        ),
      ),
      backgroundColor: colors[index],
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextFormField(
            focusNode: focusNode,
            cursorHeight: 80,
            maxLines: 8,
            controller: text,
            minLines: 1,
            textAlign: TextAlign.center,
            onChanged: (value) {
              setState(() {
                onChnage = value;
              });
            },
            cursorColor: Colors.white,
            textAlignVertical: TextAlignVertical.top,
            style: styles[fontIndex],
            decoration: InputDecoration(
                hintText: 'Type a any status',
                border: OutlineInputBorder(borderSide: BorderSide.none)),
          ),
        ],
      ),
    );
  }

  Widget emojiSelect() {
    return Container(
      width: 500,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: EmojiPicker(
          rows: 3,
          columns: 7,
          onEmojiSelected: (emoji, category) {
            setState(() {
              text.text = text.text += emoji.emoji;
            });
          },
        ),
      ),
    );
  }
}
