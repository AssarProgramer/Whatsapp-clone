import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class Status extends StatefulWidget {
  @override
  _StatusState createState() => _StatusState();
}

class _StatusState extends State<Status> {
  int _radioValue = 0;

  void _handleRadioValueChange(int value) {
    setState(() {
      _radioValue = value;
      switch (_radioValue) {
        case 0:
          break;
        case 1:
          break;
        case 2:
          break;
      }
    });
  }

  Widget _buildRadio(
      {@required String title,
      @required int groupValue,
      @required Function onChange}) {
    return ListTile(
      leading: Radio(
        materialTapTargetSize: MaterialTapTargetSize.padded,
        activeColor: Color(0xff075e54),
        autofocus: true,
        toggleable: true,
        mouseCursor: MouseCursor.defer,
        value: 0,
        groupValue: groupValue,
        onChanged: onChange,
      ),
      title: Text(
        title,
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Status Privacy"),
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
                  Text(
                    "Who can see my status updates",
                    style: TextStyle(
                        color: Color(0xff075e54),
                        fontWeight: FontWeight.bold,
                        fontSize: 18),
                  ),
                  _buildRadio(
                    title: "My contacts",
                    groupValue: _radioValue,
                    onChange: _handleRadioValueChange,
                  ),
                  _buildRadio(
                    title: "My contacts except...",
                    groupValue: _radioValue,
                    onChange: _handleRadioValueChange,
                  ),
                  _buildRadio(
                    title: "Only share with...",
                    groupValue: _radioValue,
                    onChange: _handleRadioValueChange,
                  ),
                  Text(
                    "Changes to your privacy settings won't affect status\nupdates that you've send already",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Color(0xff858b90),
                      fontSize: 15,
                    ),
                  ),
                ],
              ),
            )),
            Expanded(
              flex: 1,
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
                              "DONE",
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
