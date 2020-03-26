import 'dart:async';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_whats_clone/widgets/providers/camera_miniatures_provider.dart';

class CameraMiniaturesList extends StatelessWidget {
  final _controller = ScrollController();

  CameraMiniaturesList();

  @override
  Widget build(BuildContext context) {
    return Container(
      key: ValueKey('a'),
      width: 104,
      child: CameraMiniaturesProvider(
        builder: (context, state) {
          final images = state.images;

          Timer(
            Duration(milliseconds: 200),
            () => _controller.animateTo(
              _controller.position.maxScrollExtent,
              duration: Duration(milliseconds: 200),
              curve: Curves.easeOut,
            ),
          );

          return ListView.builder(
            dragStartBehavior: DragStartBehavior.down,
            controller: _controller,
            itemCount: images.length,
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
                    images[index],
                    width: 72,
                    height: 72,
                    fit: BoxFit.cover,
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
