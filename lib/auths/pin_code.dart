import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:whatsapp_clone/config/colors.dart';
import '../pages/setprofile_page.dart';

class PinCode extends StatefulWidget {
  final String phoneNumber;
  final verificationId;
  final auth;

  const PinCode({Key key, this.phoneNumber, this.auth, this.verificationId})
      : super(key: key);

  @override
  _PinCodeState createState() => _PinCodeState();
}

class _PinCodeState extends State<PinCode> {
  TextEditingController _pinCodeController = TextEditingController();
  @override
  Widget build(BuildContext context) {
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
                    fontWeight: FontWeight.w500,
                  ),
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
            _pinCodeWidget(),
            Expanded(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: MaterialButton(
                  color: highlightColor,
                  onPressed: _submitSmsCode,
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
      ),
    );
  }

  Widget _pinCodeWidget() {
    return Column(
      children: <Widget>[
        PinCodeTextField(
          appContext: context,
                  controller: _pinCodeController,
          length: 6,
          backgroundColor: Colors.transparent,
          obscureText: true,
          autoDisposeControllers: false,
          onChanged: (pinCode) {
            print(pinCode);
          },
        ),
        Text("Enter your 6 digit code")
      ],
    );
  }

  void _submitSmsCode() async {
    if (_pinCodeController.text.isNotEmpty) {
      final code = _pinCodeController.text.trim();
      try {
        var credential = PhoneAuthProvider.credential(
            verificationId: widget.verificationId, smsCode: code);

        UserCredential result =
            await widget.auth.signInWithCredential(credential);

        var user = result.user;

        if (user != null) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => SetProfilePage(
                phoneNumber: widget.phoneNumber,
              ),
            ),
          );
        }
      } catch (er) {
        switch (er.toString()) {
          case '[firebase_auth/invalid-verification-code] The sms verification code used to create the phone auth credential is invalid. Please resend the verification code sms and be sure use the verification code provided by the user.':
            print("No");

            showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: Text("Error"),
                    content: Text("Code Is Not Correct"),
                  );
                });
            break;
        }
      }
    }
  }
}
