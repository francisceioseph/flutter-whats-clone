import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_whats_clone/redux/actions/camera_controls_actions.dart';
import 'package:flutter_whats_clone/redux/actions/camera_miniatures_actions.dart';
import 'package:flutter_whats_clone/redux/store.dart';
import 'package:flutter_whats_clone/services/file_service.dart';
import 'package:flutter_whats_clone/widgets/components/camera/camera_controls.dart';
import 'package:flutter_whats_clone/widgets/components/camera/camera_miniatures_list.dart';

class CameraPageBody extends StatefulWidget {
  final List<CameraDescription> cameras;

  CameraPageBody({this.cameras});

  @override
  _CameraPageBodyState createState() => _CameraPageBodyState();
}

class _CameraPageBodyState extends State<CameraPageBody> {
  int _cameraIndex = 0;
  FileService fileService = FileService();
  bool isRecordingVideo = false;

  CameraDescription _camera;
  CameraController _controller;
  Future<void> _cameraInitializer;

  @override
  void initState() {
    super.initState();

    _camera = widget.cameras[_cameraIndex];

    _controller = CameraController(
      _camera,
      ResolutionPreset.ultraHigh,
    );

    _cameraInitializer = _controller.initialize();

    store.dispatch(DisableFlashButton());

    if (widget.cameras.length < 2) {
      store.dispatch(DisableFlipButton());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Camera')),
      body: Container(
        child: FutureBuilder(
          future: _cameraInitializer,
          builder: (context, snap) {
            if (snap.connectionState == ConnectionState.done) {
              return Stack(
                children: <Widget>[
                  Container(
                    child: CameraPreview(_controller),
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
                      controller: _controller,
                    ),
                  )
                ],
              );
            } else {
              return Center(child: CircularProgressIndicator());
            }
          },
        ),
      ),
    );
  }

  void _alternateCamera() async {
    store.dispatch(DisableFlipButton());
    store.dispatch(DisableMainButton());

    try {
      await _controller.dispose();

      setState(() {
        _cameraIndex = _cameraIndex == 0 ? 1 : 0;
        _camera = widget.cameras[_cameraIndex];
        _controller = CameraController(
          _camera,
          ResolutionPreset.ultraHigh,
        );

        _cameraInitializer = _controller.initialize();
      });
    } catch (e) {
      print(e);
    } finally {
      store.dispatch(ToggleFlipButton());
      store.dispatch(EnableFlipButton());
      store.dispatch(EnableMainButton());
    }
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();

    store.dispatch(DisposeFilePaths());
  }
}
