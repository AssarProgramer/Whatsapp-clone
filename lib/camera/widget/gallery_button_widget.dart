import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:whatsapp_clone/camera/model/media_source.dart';

import 'list_tile_widget.dart';

class GalleryButtonWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) =>  Container(
    child: Column(
          children: [
            RaisedButton(
              child: Text('From Gallery'),
              shape: StadiumBorder(),
              onPressed: () => pickGalleryMedia(context),
              color: Theme.of(context).primaryColor,
              textColor: Colors.white,
            ),
          ],
        ),
  );

  Future pickGalleryMedia(BuildContext context) async {
    final MediaSource source = ModalRoute.of(context).settings.arguments;

    final getMedia = source == MediaSource.image
        ? ImagePicker().getImage
        : ImagePicker().getVideo;

    final media = await getMedia(source: ImageSource.gallery);
    final file = File(media.path);

    Navigator.of(context).pop(file);
  }
}
