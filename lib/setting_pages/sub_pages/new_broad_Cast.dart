import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:whatsapp_clone/widgets/list_tile_items.dart';

class NewBroadCast extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.green,
        onPressed: () {},
        child: Icon(
          Icons.check,
          size: 30,
          color: Colors.white,
        ),
      ),
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'New broadcast',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
            ),
            SizedBox(
              height: 2,
            ),
            Text(
              '0 of 256 selected',
              style: TextStyle(
                fontSize: 14,
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
          Container(
            width: double.infinity,
            height: 90,
            color: Colors.white60,
            padding: EdgeInsets.only(left: 20),
            child: Center(
              child: Wrap(
                children: [
                  Text(
                    'Only contacts with +92 123456789 in their address ',
                    style: TextStyle(
                      fontSize: 17.90,
                      fontWeight: FontWeight.w300,
                      color: Colors.grey,
                    ),
                  ),
                  Center(
                    child: Text(
                      'book will receive your broadcast messages.',
                      style: TextStyle(
                        fontSize: 17.90,
                        fontWeight: FontWeight.w300,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Divider(
            color: Colors.grey,
            thickness: 1,
          ),
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
