import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
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
  CameraDescription _camera;
  CameraController _controller;

  @override
  void initState() {
    super.initState();
    _camera = widget.cameras[_cameraIndex];

    _controller = CameraController(
      _camera,
      ResolutionPreset.medium,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Camera')),
      body: Container(
        child: FutureBuilder(
          future: _controller.initialize(),
          builder: (context, snap) {
            if (snap.connectionState == ConnectionState.done) {
              return Stack(
                children: <Widget>[
                  CameraPreview(_controller),
                  Positioned(
                    bottom: 8,
                    left: 0,
                    right: 0,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        FlatButton(
                          child: Icon(Icons.flash_on),
                          onPressed: null,
                        ),
                        FlatButton(
                          child: Icon(Icons.radio_button_unchecked),
                          onPressed: null,
                        ),
                        FlatButton(
                          child: Icon(Icons.rotate_left),
                          onPressed: null,
                        ),
                      ],
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
      // floatingActionButton: FloatingActionButton(
      //   child: Icon(Icons.photo_camera),
      //   onPressed: () async {
      //     try {
      //       await _initializeControllerFuture;

      //       final path = join(
      //         (await getApplicationDocumentsDirectory()).path,
      //         '${DateTime.now()}.png',
      //       );

      //       await _controller.takePicture(path);
      //     } catch (e) {
      //       print(e);
      //     }
      //   },
      // ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
}
