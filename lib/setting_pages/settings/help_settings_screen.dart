import 'package:flutter/material.dart';

import 'package:whatsapp_clone/widgets/setting_item.dart';

import 'package:whatsapp_clone/setting_pages/settings/help/help_appinfo_settings_screen.dart';

class HelpSettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Help'),
      ),
      body: ListView(
        children: <Widget>[
          SettingItem(
            icon: Icons.help_outline,
            title: 'FAQ',
            onTap: () {
              String url = 'https://faq.whatsapp.com/';
            },
          ),
          SettingItem(
            icon: Icons.group,
            title: 'Contact us',
            subtitle: 'Questions? Need help?',
            onTap: () {},
          ),
          SettingItem(
              icon: Icons.insert_drive_file,
              title: 'Terms and Privacy Policy',
              onTap: () {
                String url = 'https://whatsapp.com/legal';
              }),
          SettingItem(
            icon: Icons.info_outline,
            title: 'App info',
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (ctx) => HelpAppInfoSettingsScreen(),
                ),
              );
            },
          )
        ],
      ),
    );
  }

  // _launchURL(String url) async {
  //   if (await canLaunch(url)) {
  //     await launch(url);
  //   } else {
  //     throw 'Could not launch $url';
  //   }
  // }
}
