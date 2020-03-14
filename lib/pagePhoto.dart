import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import 'album.dart';

class PhotoPage extends StatelessWidget {
  PhotoPage({@required this.curAlbum, this.imageProvider});

  final ImageProvider imageProvider;
  final Album curAlbum;

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints.expand(
        height: MediaQuery.of(context).size.height,
      ),
      child: GestureDetector(
        onTapDown: (_) {
          Navigator.pop(context);
        },
        child: PhotoView(
          imageProvider: NetworkImage(curAlbum.thumb),
          minScale: PhotoViewComputedScale.contained * 0.8,
          maxScale: PhotoViewComputedScale.covered * 1.8,
        ),
      ),
    );
  }
}
