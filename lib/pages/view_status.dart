import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:story_view/story_view.dart';
import 'package:whatsapp_clone/camera/model/media_source.dart';
import 'package:whatsapp_clone/config/colors.dart';

class ViewStatus extends StatelessWidget {
  var resource;
  var source;
  String taxts;
  var fonts;
  var colors;
  ViewStatus({this.resource, this.source, this.colors, this.fonts, this.taxts});
  final _storyController = StoryController();

  @override
  Widget build(BuildContext context) {
    print(resource);
    final controller = StoryController();
    final List<StoryItem> storyItems = [
      taxts == '' && taxts == null
          ? Container()
          : StoryItem.text(
              title: taxts,
              backgroundColor: colors == 'blueGrey'
                  ? Colors.grey
                  : colors == 'red'
                      ? Colors.red
                      : colors == 'blue'
                          ? Colors.blue
                          : colors == 'cyan'
                              ? Colors.cyan
                              : colors == 'green'
                                  ? Colors.green
                                  : colors == 'deepPurpleAccent'
                                      ? Colors.deepPurpleAccent
                                      : colors == 'pink'
                                          ? Colors.pink
                                          : colors == 'indigoAccent'
                                              ? Colors.indigoAccent
                                              : colors == 'teal'
                                                  ? Colors.teal
                                                  : Colors.transparent,
              textStyle: fonts == 'lato'
                  ? GoogleFonts.lato(fontSize: 40)
                  : fonts == 'zcoolXiaoWei'
                      ? GoogleFonts.zcoolXiaoWei(fontSize: 40)
                      : fonts == 'zeyada'
                          ? GoogleFonts.zeyada(fontSize: 40)
                          : fonts == 'trocchi'
                              ? GoogleFonts.trocchi(fontSize: 40)
                              : fonts == 'tomorrow'
                                  ? GoogleFonts.tomorrow(fontSize: 40)
                                  : fonts == 'tinos'
                                      ? GoogleFonts.tinos(fontSize: 40)
                                      : fonts == 'stintUltraExpanded'
                                          ? GoogleFonts.stintUltraExpanded(
                                              fontSize: 40)
                                          : fonts == 'sriracha'
                                              ? GoogleFonts.sriracha(
                                                  fontSize: 40)
                                              : fonts == 'signikaNegative'
                                                  ? GoogleFonts.signikaNegative(
                                                      fontSize: 40)
                                                  : GoogleFonts.imprima(
                                                      fontSize: 40),
            ),
      source == 'image'
          ? StoryItem.pageImage(
              url: resource,
              controller: _storyController,
            )
          : source == 'video'
              ? StoryItem.pageVideo(
                  resource,
                  controller: _storyController,
                )
              : StoryItem.text(
                  title: 'No Status i will app next verstion',
                  backgroundColor: Colors.black)
    ];
    return Scaffold(
      body: Stack(
        children: [
          StoryView(
            onComplete: () {
              Navigator.of(context).pop();
            },
            storyItems: storyItems,
            controller: controller,
            inline: false,
            repeat: true,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 320, top: 50),
            child: InkWell(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: CircleAvatar(
                radius: 15,
                backgroundColor: fabBgColor,
                child: Icon(
                  Icons.close,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
