import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:whatsapp_clone/camera/model/media_source.dart';
import 'package:whatsapp_clone/camera/widget/list_tile_widget.dart';

class CameraButtonWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Container(
    height: 400,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RaisedButton(
              child: Text('From Camera'),
              shape: StadiumBorder(),
              onPressed: () => pickCameraMedia(context),
              color: Theme.of(context).primaryColor,
              textColor: Colors.white,
            ),
          ],
        ),
  );

  Future pickCameraMedia(BuildContext context) async {
    final MediaSource source = ModalRoute.of(context).settings.arguments;

    final getMedia = source == MediaSource.image
        ? ImagePicker().getImage
        : ImagePicker().getVideo;

    final media = await getMedia(source: ImageSource.camera);
    final file = File(media.path);

    Navigator.of(context).pop(file);
  }
}
