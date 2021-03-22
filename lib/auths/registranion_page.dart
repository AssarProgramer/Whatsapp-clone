import 'dart:ui';

import 'package:country_code_picker/country_code_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:whatsapp_clone/auths/pin_code.dart';
import 'package:whatsapp_clone/config/colors.dart';

class RegistrationPage extends StatefulWidget {
  @override
  _RegistrationPageState createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  bool isLoading = false;
  var verificationIds;
  var _countryCode = '92';
  var _countryName;
  String _phoneNumber = "";
  TextEditingController _phoneAuthController = TextEditingController();

  Future<bool> loginUser(String phone, BuildContext context) async {
    FirebaseAuth _auth = FirebaseAuth.instance;

    setState(() {
      isLoading = true;
    });
    _auth.verifyPhoneNumber(
      phoneNumber: phone,
      timeout: Duration(seconds: 60),
      verificationCompleted: (AuthCredential credential) async {
        Navigator.of(context).pop();

        final UserCredential result =
            await _auth.signInWithCredential(credential);

        User user = result.user;

        if (user != null) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => PinCode(
                phoneNumber: _phoneNumber,
                verificationId: verificationIds,
                auth: _auth,
              ),
            ),
          );
        } else {
          showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: Text("Alert Dialog"),
                  content: Text('Error'),
                );
              });
          setState(() {
            isLoading = false;
          });
        }
        setState(() {
          isLoading = false;
        });
      },
      verificationFailed: (var exception) {
        print(exception.toString());
        switch (exception.toString()) {
          case '[firebase_auth/invalid-phone-number] The format of the phone number provided is incorrect. Please enter the phone number in a format that can be parsed into E.164 format. E.164 phone numbers are written in the format [+][country code][subscriber number including area code]. [ TOO_LONG ]':
            print("No");

            showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: Text("Error"),
                    content: Text("Phone Number Is Not Correct"),
                  );
                });
            break;
        }
      },
      codeSent: (String verificationId, [int forceResendingToken]) {
        setState(() {
          verificationIds = verificationId;
        });
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => PinCode(
              phoneNumber: _phoneNumber,
              verificationId: verificationId,
              auth: _auth,
            ),
          ),
        );
      },
      codeAutoRetrievalTimeout: (String verificationId) {},
    );
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: isLoading == false ? _bodyWidget():Center(
              child: CircularProgressIndicator(backgroundColor: Colors.black),
            ),
    );
  }

  Widget _bodyWidget() {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(""),
                Text(
                  "Verify your phone number",
                  style: TextStyle(
                      fontSize: 18,
                      color: highlightColor,
                      fontWeight: FontWeight.w500),
                ),
                Icon(Icons.more_vert)
              ],
            ),
            SizedBox(
              height: 30,
            ),
            Text(
              "WhatsApp Clone will send and SMS message (carrier charges may apply) to verify your phone number. Enter your country code and phone number:",
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            SizedBox(
              height: 30,
            ),
            CountryCodePicker(
              initialSelection: 'pakistan',
              showCountryOnly: false,
              hideMainText: false,
              showOnlyCountryWhenClosed: false,
              favorite: ['+92', 'Pk'],
              showDropDownButton: true,
              showFlagMain: true,
              showFlagDialog: true,
              showFlag: true,
              enabled: true,
              alignLeft: true,
              onChanged: (country) {
                setState(() {
                  _countryCode = country.dialCode;
                  _countryName = country.name;
                });
              },
            ),
            Divider(
              color: primaryColor,
            ),
            Row(
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                      border: Border(
                          bottom: BorderSide(
                    width: 1.50,
                    color: highlightColor,
                  ))),
                  width: 80,
                  height: 42,
                  alignment: Alignment.center,
                  child: Text(_countryCode == null ? '92' : _countryCode),
                ),
                SizedBox(
                  width: 8.0,
                ),
                Expanded(
                  child: Container(
                    height: 40,
                    child: TextField(
                      controller: _phoneAuthController,
                      decoration: InputDecoration(hintText: "Phone Number"),
                    ),
                  ),
                ),
              ],
            ),
            Expanded(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: MaterialButton(
                  color: highlightColor,
                  onPressed: _submitVerifyPhoneNumber,
                  child: Text(
                    "Next",
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _submitVerifyPhoneNumber() {
    if (_phoneAuthController.text.isNotEmpty) {
      _phoneNumber = "+$_countryCode${_phoneAuthController.text}";
      loginUser(_phoneNumber, context);
    }
  }
}
