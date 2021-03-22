import 'package:flutter/material.dart';
import 'package:whatsapp_clone/config/colors.dart';
class SwitchSettingItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final Function onChanged;
  final value;
  final padding;

  SwitchSettingItem(
      {this.icon,
      this.title,
      this.subtitle,
      this.onChanged,
      this.value,
      this.padding});

  @override
  Widget build(BuildContext context) {
    if (subtitle == null) {
      ListTileTheme(
        contentPadding:
            padding ?? EdgeInsets.symmetric(vertical: 16.0, horizontal: 24.0),
        child: SwitchListTile(
          title: Padding(
            padding: const EdgeInsets.only(bottom: 0.0),
            child: Text(
              title,
            ),
          ),
          value: value,
          activeColor: darkColor,
          onChanged: onChanged,
        ),
      );
    }
    return ListTileTheme(
      contentPadding:
          padding ?? EdgeInsets.symmetric(vertical: 16.0, horizontal: 24.0),
      child: SwitchListTile(
        title: Padding(
          padding: const EdgeInsets.only(bottom: 0.0),
          child: Text(
            title,
          ),
        ),
        subtitle: Text(
          subtitle,
        ),
        value: value,
        activeColor: darkColor,
        onChanged: onChanged,
      ),
    );
  }
}
