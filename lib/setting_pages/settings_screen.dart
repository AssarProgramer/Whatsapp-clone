import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:whatsapp_clone/model/currentUser.dart';
// import 'package:example/presentation/widgets/setting_item.dart';
// import '../pages/future_todo_screen.dart';

// import 'package:example/presentation/pages/future_todo_screen.dart';

// import 'package:example/presentation/pages/settings/account_settings_screen.dart';

// import 'package:example/presentation/pages/settings/help_settings_screen.dart';
// import 'package:example/presentation/pages/settings/notifications_settings_screen.dart';
// import 'package:example/presentation/pages/settings/your_profile_screen.dart';
import '../setting_pages/settings/help_settings_screen.dart';
import '../setting_pages/settings/your_profile_screen.dart';
import '../setting_pages/settings/account_settings_screen.dart';
import '../setting_pages/settings/help/android_intent_helpers.dart';
import '../widgets/setting_item.dart';

class SettingsScreen extends StatelessWidget {
  CurrentUser currentUser;
  SettingsScreen({this.currentUser});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Settings'),
        ),
        body: ListView(
          children: <Widget>[
            ListTile(
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
              leading: Hero(
                tag: 'profile-pic',
                child: CircleAvatar(
                  radius: 32.0,
                  backgroundImage:
                      CachedNetworkImageProvider(currentUser.currrentUserImage),
                ),
              ),
              title: Text(
              currentUser.currentUserName,
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.w500,
                ),
              ),
              subtitle: Text(
                'Hey there! i am useing pak1',
                style: TextStyle(
                  fontSize: 12.0,
                ),
              ),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (ctx) => YourProfileScreen(currentUser:currentUser),
                  ),
                );
              },
            ),
            Divider(
              height: 0.0,
            ),
            SettingItem(
                icon: Icons.vpn_key,
                title: 'Account',
                subtitle: 'Privacy, security, change number',
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (ctx) => AccountSettingsScreen(),
                    ),
                  );
                }),
            SettingItem(
                icon: Icons.chat,
                title: 'Chats',
                subtitle: 'Backup, history, wallpaper',
                onTap: () {}),
            SettingItem(
                icon: Icons.notifications,
                title: 'Notifications',
                subtitle: 'Message, group & call tones',
                onTap: () {}),
            // SettingItem(
            //     icon: Icons.data_usage,
            //     title: 'Data and storage usage',
            //     subtitle: 'Network usage, auto-download',
            //     onTap: () {
            //       Navigator.of(context).push(
            //         MaterialPageRoute(
            //           builder: (ctx) => FutureTodoScreen(),
            //         ),
            //       );
            //     }),
            SettingItem(
                icon: Icons.help_outline,
                title: 'Help',
                subtitle: 'FAQ, contact us, privacy policy',
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (ctx) => HelpSettingsScreen(),
                    ),
                  );
                }),
            Divider(
              indent: 72.0,
              height: 0.0,
            ),
            Builder(builder: (context) {
              return SettingItem(
                  icon: Icons.group, title: 'Invite a friend', onTap: () {});
            }),
          ],
        ));
  }
}
