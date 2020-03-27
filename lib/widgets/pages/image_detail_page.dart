import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_whats_clone/widgets/components/inline_form/inline_form.dart';

class ImageDetailPage extends StatelessWidget {
  static const routeName = '/image-detail';

  final File file;

  ImageDetailPage({@required this.file});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey.withOpacity(0.25),
      ),
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            SingleChildScrollView(
              child: Center(
                child: Image.file(file),
              ),
            ),
            Positioned(
              bottom: 16,
              right: 16,
              left: 16,
              child: InlineForm(),
            )
          ],
        ),
      ),
    );
  }
}
