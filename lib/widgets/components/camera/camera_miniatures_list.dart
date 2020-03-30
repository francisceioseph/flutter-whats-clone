import 'dart:async';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_whats_clone/widgets/pages/image_detail_page.dart';
import 'package:flutter_whats_clone/widgets/connectors/camera_miniatures_connector.dart';

class CameraMiniaturesList extends StatelessWidget {
  final _controller = ScrollController();

  CameraMiniaturesList();

  @override
  Widget build(BuildContext context) {
    return Container(
      key: ValueKey('a'),
      width: 104,
      child: CameraMiniaturesConnector(
        builder: (context, state) {
          final images = state.images;

          Timer(
            Duration(milliseconds: 200),
            () {
              if (_controller.positions.length > 0) {
                _controller.animateTo(
                  _controller.position.maxScrollExtent,
                  duration: Duration(milliseconds: 200),
                  curve: Curves.easeOut,
                );
              }
            },
          );

          return ListView.builder(
            dragStartBehavior: DragStartBehavior.down,
            controller: _controller,
            itemCount: images.length,
            itemBuilder: (BuildContext context, int index) {
              return InkWell(
                child: Container(
                  margin: EdgeInsets.only(
                    top: 16,
                    right: 16,
                    left: 16,
                  ),
                  child: Hero(
                    tag: images[index].path,
                    child: ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(64)),
                      child: Image.file(
                        images[index],
                        width: 72,
                        height: 72,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                onTap: () {
                  Navigator.of(context).pushNamed(
                    ImageDetailPage.routeName,
                    arguments: images[index],
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}
