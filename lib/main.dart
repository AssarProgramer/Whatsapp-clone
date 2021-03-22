import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:whatsapp_clone/call/pick_layout.dart';
import 'package:whatsapp_clone/config/colors.dart';
import 'package:whatsapp_clone/config/user_provider.dart';
import 'package:whatsapp_clone/pages/welcome_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:whatsapp_clone/screens/home_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<UserProvider>(
      create: (context)=>UserProvider(),
      child: MaterialApp(
        theme: ThemeData(primaryColor: darkColor),
        home: StreamBuilder(
            stream: FirebaseAuth.instance.authStateChanges(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return PickupLayout(
                  scaffold: HomeScreen(
                    initialIndex: 1,
                  ),
                );
              }
              return WelcomeScreen();
            }),
      ),
    );
  }
}
