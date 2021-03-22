import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:whatsapp_clone/config/user_provider.dart';
import 'package:provider/provider.dart';
import '../model/call_user.dart';
import '../config/call_method.dart';
import './pickup_screen.dart';

class PickupLayout extends StatelessWidget {
  final Widget scaffold;
  final CallMethods callMethods = CallMethods();

  PickupLayout({
    @required this.scaffold,
  });

  @override
  Widget build(BuildContext context) {
    final UserProvider userProvider = Provider.of<UserProvider>(context);
    return (userProvider != null && userProvider.getUser != null)
        ? StreamBuilder<DocumentSnapshot>(
            stream: callMethods.callStream(uid: userProvider.getUser.uid),
            builder: (context, snapshot) {
              if (snapshot.hasData && snapshot.data.data() != null) {
                CallUser call = CallUser.fromMap(snapshot.data.data());

                if (!call.hasDialled) {
                  return PickupScreen(
                    call: call,
                  );
                }
                return scaffold;
              }
              return scaffold;
            },
          )
        : scaffold;
  }
}
