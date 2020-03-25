import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_whats_clone/widgets/components/camera/camera_controls.dart';
import 'package:flutter_whats_clone/widgets/components/camera/camera_miniatures_list.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

class CameraPageBody extends StatefulWidget {
  final List<CameraDescription> cameras;

  CameraPageBody({this.cameras});

  @override
  _CameraPageBodyState createState() => _CameraPageBodyState();
}

class _CameraPageBodyState extends State<CameraPageBody> {
  int _cameraIndex = 0;
  List<String> _previewPaths = [];

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
                    child: CameraMiniaturesList(
                      imagesPath: _previewPaths,
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: CameraControls(
                      currentCameraIndex: _cameraIndex,
                      onCameraButtonPressed: _cameraButtonPressedHandler,
                      onFlipCameraButtonPressed: _alternateCamera,
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
    }
  }

  void _cameraButtonPressedHandler() async {
    try {
      await _cameraInitializer;
      final tempDir = await getTemporaryDirectory();
      final imagePath = join(
        tempDir.path,
        'IMG_${DateTime.now().toIso8601String()}.png',
      );

      await _controller.takePicture(imagePath);

      setState(() {
        _previewPaths.add(imagePath);
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
}
