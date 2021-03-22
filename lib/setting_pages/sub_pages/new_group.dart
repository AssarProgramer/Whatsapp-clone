import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:whatsapp_clone/widgets/list_tile_items.dart';

class NewGroup extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0xff08d160),
        onPressed: () {},
        child: Icon(
          Icons.arrow_forward,
          size: 30,
          color: Color(0xfffafafa),
        ),
      ),
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'New Group',
            ),
            SizedBox(
              height: 2,
            ),
            Text(
              'Add participants',
              style: TextStyle(
                fontSize: 14,
                color: Colors.white70,
              ),
            ),
          ],
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: Icon(
              Icons.search,
              color: Colors.white,
              size: 30,
            ),
          ),
        ],
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: ListView(
              children: [
                ListTileItem(
                  netWorkImage:
                      'https://dyl80ryjxr1ke.cloudfront.net/external_assets/hero_examples/hair_beach_v1785392215/original.jpeg',
                  subtitle: 'Hey there! I am using WhatsApp',
                  title: 'Tony Stark',
                ),
                ListTileItem(
                  netWorkImage:
                      'https://www.templatebeats.com/files/images/profile_user.jpg',
                  subtitle: 'Hey there! I am using WhatsApp',
                  title: 'Tony Jr',
                ),
                ListTileItem(
                  netWorkImage:
                      'https://riportus.com/wp-content/uploads/2016/11/team1-5.jpg',
                  subtitle: 'Hey there! I am using WhatsApp',
                  title: 'Carry Manati',
                ),
                ListTileItem(
                  netWorkImage:
                      'https://www.eventiz.biz/wp-content/uploads/2015/12/speaker-3.jpg',
                  subtitle: 'Hey there! I am using WhatsApp',
                  title: 'Sanju Baba',
                ),
                ListTileItem(
                  netWorkImage:
                      'https://dyl80ryjxr1ke.cloudfront.net/external_assets/hero_examples/hair_beach_v1785392215/original.jpeg',
                  subtitle: 'Hey there! I am using WhatsApp',
                  title: 'Tony Stark',
                ),
                ListTileItem(
                  netWorkImage:
                      'https://dyl80ryjxr1ke.cloudfront.net/external_assets/hero_examples/hair_beach_v1785392215/original.jpeg',
                  subtitle: 'Hey there! I am using WhatsApp',
                  title: 'Tony Stark',
                ),
                ListTileItem(
                  netWorkImage:
                      'https://dyl80ryjxr1ke.cloudfront.net/external_assets/hero_examples/hair_beach_v1785392215/original.jpeg',
                  subtitle: 'Hey there! I am using WhatsApp',
                  title: 'Tony Stark',
                ),
                ListTileItem(
                  netWorkImage:
                      'https://dyl80ryjxr1ke.cloudfront.net/external_assets/hero_examples/hair_beach_v1785392215/original.jpeg',
                  subtitle: 'Hey there! I am using WhatsApp',
                  title: 'Tony Stark',
                ),
                ListTileItem(
                  netWorkImage:
                      'https://dyl80ryjxr1ke.cloudfront.net/external_assets/hero_examples/hair_beach_v1785392215/original.jpeg',
                  subtitle: 'Hey there! I am using WhatsApp',
                  title: 'Tony Stark',
                ),
                ListTileItem(
                  netWorkImage:
                      'https://dyl80ryjxr1ke.cloudfront.net/external_assets/hero_examples/hair_beach_v1785392215/original.jpeg',
                  subtitle: 'Hey there! I am using WhatsApp',
                  title: 'Tony Stark',
                ),
                ListTileItem(
                  netWorkImage:
                      'https://dyl80ryjxr1ke.cloudfront.net/external_assets/hero_examples/hair_beach_v1785392215/original.jpeg',
                  subtitle: 'Hey there! I am using WhatsApp',
                  title: 'Tony Stark',
                ),
                ListTileItem(
                  netWorkImage:
                      'https://dyl80ryjxr1ke.cloudfront.net/external_assets/hero_examples/hair_beach_v1785392215/original.jpeg',
                  subtitle: 'Hey there! I am using WhatsApp',
                  title: 'Tony Stark',
                ),
                ListTileItem(
                  netWorkImage:
                      'https://dyl80ryjxr1ke.cloudfront.net/external_assets/hero_examples/hair_beach_v1785392215/original.jpeg',
                  subtitle: 'Hey there! I am using WhatsApp',
                  title: 'Tony Stark',
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

//   _launchURL(String url) async {
//     if (await canLaunch(url)) {
//       await launch(url);
//     } else {
//       throw 'Could not launch $url';
//     }
//   }
}
