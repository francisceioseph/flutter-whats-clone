import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';

class CameraMiniaturesList extends StatelessWidget {
  final List<String> imagesPath;
  final _controller = ScrollController();

  CameraMiniaturesList({
    this.imagesPath,
  });

  @override
  Widget build(BuildContext context) {
    if (imagesPath.length > 0) {
      Timer(
        Duration(milliseconds: 300),
        () => _controller.jumpTo(_controller.position.maxScrollExtent),
      );
    }

    return Container(
      width: 104,
      child: ListView.builder(
          controller: _controller,
          itemCount: imagesPath.length,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              margin: EdgeInsets.only(
                top: 16,
                right: 16,
                left: 16,
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(64)),
                child: Image.file(
                  File(imagesPath[index]),
                  width: 72,
                  height: 72,
                  fit: BoxFit.cover,
                ),
              ),
            );
          }),
    );
  }
}
