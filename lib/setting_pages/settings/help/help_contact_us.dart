import 'package:flutter/material.dart';
import 'package:whatsapp_clone/config/colors.dart';

class HelpContactUs extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {},
        ),
        title: Text(
          'Contact us',
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              height: 400,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextFormField(
                    maxLines: 4,
                    decoration: InputDecoration(
                        fillColor: Colors.indigo[50],
                        filled: true,
                        hintText: 'Describe your problem'),
                  ),
                  Text(
                    'Add screenshots (optional)',
                    style: TextStyle(fontSize: 15, color: darkColor),
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          margin: EdgeInsets.all(2),
                          height: 130,
                          color: Colors.indigo[50],
                          child: Padding(
                            padding: const EdgeInsets.all(40),
                            child: CircleAvatar(
                              backgroundColor: Color(0xffcdcdcd),
                              child: Icon(
                                Icons.add,
                                size: 30,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          margin: EdgeInsets.all(2),
                          height: 130,
                          color: Colors.indigo[50],
                          child: Padding(
                            padding: const EdgeInsets.all(40),
                            child: CircleAvatar(
                              backgroundColor: Color(0xffcdcdcd),
                              child: Icon(
                                Icons.add,
                                size: 30,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          margin: EdgeInsets.all(2),
                          height: 130,
                          color: Colors.indigo[50],
                          child: Padding(
                            padding: const EdgeInsets.all(40),
                            child: CircleAvatar(
                              backgroundColor: Color(0xffcdcdcd),
                              child: Icon(
                                Icons.add,
                                size: 30,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Have you read our FAQ yet?',
                ),
                Container(
                  height: 50,
                  width: 80,
                  child: RaisedButton(
                    elevation: 0,
                    color: Colors.grey,
                    onPressed: () {},
                    child: Text(
                      'NEXT',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
