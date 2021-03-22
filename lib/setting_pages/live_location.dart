import 'package:flutter/material.dart';

class LiveLocation extends StatefulWidget {
  @override
  _LiveLocationState createState() => _LiveLocationState();
}

class _LiveLocationState extends State<LiveLocation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Live location"),
        // leading: IconButton(
        //   icon: Icon(Icons.arrow_back),
        //   onPressed: () {},
        // ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: Column(
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CircleAvatar(
                            maxRadius: 60,
                          )
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Wrap(
                        children: [
                          Text(
                            "You aren't sharing live location in any chats",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Divider(),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "if you have both a new phone & a new number,first change",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color(0xff858b90),
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        "your number on your old phone.",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color(0xff858b90),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(),
            )
          ],
        ),
      ),
    );
  }
}
