import 'dart:io';

import 'package:flutter/material.dart';

class ImageDetailPage extends StatelessWidget {
  static const routeName = '/image-detail';

  final File imageFile;

  ImageDetailPage({@required this.imageFile});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Image'),
      ),
      body: Container(
        child: Hero(
          tag: imageFile.path,
          child: Center(
            child: Image.file(imageFile),
          ),
        ),
      ),
    );
  }
}
