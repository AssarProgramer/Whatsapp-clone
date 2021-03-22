import 'package:flutter/material.dart';

import 'package:whatsapp_clone/widgets/setting_item.dart';




import 'package:whatsapp_clone/setting_pages/settings/account/account_privacy_settings_screen.dart';
import 'package:whatsapp_clone/setting_pages/settings/account/account_security_settings_screen.dart';
import 'package:whatsapp_clone/setting_pages/settings/account/account_twostep_settings_screen.dart';

class AccountSettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Account'),
      ),
      body: ListView(
        children: <Widget>[
          // SettingItem(
          //   icon: Icons.lock,
          //   title: 'Privacy',
          //   onTap: () {
          //     Navigator.of(context).push(
          //       MaterialPageRoute(
          //         builder: (ctx) => AccountPrivacySettingsScreen(),
          //       ),
          //     );
          //   },
          // ),
          // SettingItem(
          //   icon: Icons.security,
          //   title: 'Security',
          //   onTap: () {
          //     Navigator.of(context).push(
          //       MaterialPageRoute(
          //         builder: (ctx) => AccountSecuritySettingsScreen(),
          //       ),
          //     );
          //   },
          // ),
          SettingItem(
            icon: Icons.verified_user,
            title: 'Two-step verification',
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (ctx) => AccountTwoStepSettingsScreen(),
                ),
              );
            },
          ),
    
          // SettingItem(
          //   icon: Icons.insert_drive_file,
          //   title: 'Request account info',
          //   onTap: () {
          //     Navigator.of(context).push(
          //       MaterialPageRoute(
          //         builder: (ctx) => RequestAccountInfo(),
          //       ),
          //     );
          //   },
          // ),
     
        ],
      ),
    );
  }
}
