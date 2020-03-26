import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_whats_clone/redux/actions/camera_actions.dart';
import 'package:flutter_whats_clone/redux/state/camera_state.dart';
import 'package:flutter_whats_clone/redux/store.dart';
import 'package:flutter_whats_clone/widgets/components/camera/camera_controls.dart';
import 'package:flutter_whats_clone/widgets/components/camera/camera_miniatures_list.dart';

class CameraPageBody extends StatefulWidget {
  final CameraState cameraState;

  CameraPageBody({
    @required this.cameraState,
  });

  @override
  _CameraPageBodyState createState() => _CameraPageBodyState();
}

class _CameraPageBodyState extends State<CameraPageBody> {
  @override
  void initState() {
    super.initState();
    store.dispatch(InitCameraPlugin());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Camera')),
      body: Container(
        child: Visibility(
          visible: widget.cameraState.controller != null,
          child: Stack(
            children: <Widget>[
              Container(
                child: CameraPreview(widget.cameraState.controller),
              ),
              Positioned(
                right: 0,
                bottom: 128,
                top: 0,
                child: CameraMiniaturesList(),
              ),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: CameraControls(
                  controller: widget.cameraState.controller,
                ),
              )
            ],
          ),
          replacement: Center(
            child: CircularProgressIndicator(),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
