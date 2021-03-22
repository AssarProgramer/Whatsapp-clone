import 'package:flutter/material.dart';
import 'package:whatsapp_clone/config/colors.dart';

class ChatBackUp extends StatefulWidget {
  @override
  _ChatBackUpState createState() => _ChatBackUpState();
}

class _ChatBackUpState extends State<ChatBackUp> {
  bool globleValue = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Chat backup',
        ),
      ),
      body: ListView(
        children: [
          Column(
            children: [
              ListTile(
                leading: Icon(
                  Icons.dashboard,
                ),
                title: Container(
                  height: 260,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Last Backup',
                        style: TextStyle(
                            color: darkColor, fontWeight: FontWeight.bold),
                      ),
                      Wrap(
                        children: [
                          Text(
                            'Back up your messages and media to Google Drive. You can restore them when you reintall WhatsApp. Your messages will also back up to your phone\'s internal storage',
                            style: TextStyle(
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Local: 2:02 AM',
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w600),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            'Google Drive: Never',
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                      RaisedButton(
                        elevation: 0,
                        child: Text(
                          'BACK UP',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        color: darkColor,
                        onPressed: () {},
                      )
                    ],
                  ),
                ),
              ),
              Divider(
                thickness: 1,
              ),
              ListTile(
                leading: Icon(
                  Icons.dashboard,
                ),
                title: Container(
                  height: 370,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Last Backup',
                        style: TextStyle(
                          color: darkColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Wrap(
                        children: [
                          Text(
                            'Messages and media backed up in Goole Drive are not protected by WhatsApp end-to-end encryption',
                            style: TextStyle(
                              fontSize: 15,
                            ),
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Back up to Google Drive',
                            style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            'Never',
                            style: TextStyle(
                              fontSize: 15,
                            ),
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Google Account',
                            style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            'None selected',
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Back up over',
                            style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            'Wi-Fi only',
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left:54.0),
                child: SwitchListTile(
                  value: (globleValue),
                  onChanged: (value) {
                    setState(
                      () {
                        globleValue = value;
                      },
                    );
                  },
                  title: Text(
                    'Include videos',
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
