import 'package:flutter/material.dart';

class ChangeNumber extends StatefulWidget {
  @override
  _ChangeNumberState createState() => _ChangeNumberState();
}

class _ChangeNumberState extends State<ChangeNumber> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Change number"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
                child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        maxRadius: 60,
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Changing your phone number will migrate your",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        "account info,groups & settings",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Before proceeding,please confirm that you are able to",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color(0xff858b90),
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        "receive SMS or calls at your new number.",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color(0xff858b90),
                        ),
                      ),
                    ],
                  ),
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
            )),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: 60,
                          width: 100,
                          child: RaisedButton(
                            color: Color(0xff08d160),
                            child: Text(
                              "Next",
                              style: TextStyle(color: Colors.white),
                            ),
                            onPressed: () {},
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
