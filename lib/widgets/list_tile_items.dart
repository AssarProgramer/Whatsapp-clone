import 'package:flutter/material.dart';

class ListTileItem extends StatelessWidget {
  final String netWorkImage;
  final String title;
  final String subtitle;
  ListTileItem({
    this.netWorkImage,
    this.subtitle,
    this.title,
  });
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        radius: 30,
        backgroundImage: NetworkImage(netWorkImage == null
            ? 'https://image.shutterstock.com/image-vector/gray-photo-placeholder-icon-design-260nw-1715467759.jpg'
            : netWorkImage),
      ),
      title: Text(
        title,
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
      ),
      subtitle: Text(
        subtitle,
        style: TextStyle(
          fontSize: 18,
          color: Colors.black45,
        ),
      ),
    );
  }
}
