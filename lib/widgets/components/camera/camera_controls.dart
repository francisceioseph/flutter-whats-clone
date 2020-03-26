import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_whats_clone/redux/actions/camera_controls_actions.dart';
import 'package:flutter_whats_clone/redux/actions/camera_miniatures_actions.dart';
import 'package:flutter_whats_clone/redux/state/camera_controls_state.dart';
import 'package:flutter_whats_clone/redux/store.dart';
import 'package:flutter_whats_clone/services/singleton.dart';
import 'package:flutter_whats_clone/widgets/components/camera/camera_button.dart';
import 'package:flutter_whats_clone/widgets/providers/camera_controls_provider.dart';

class CameraControls extends StatelessWidget {
  final CameraController controller;

  CameraControls({
    @required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(
            top: 16,
            bottom: 16,
          ),
          child: Text(
            'Press to video, touch to photo',
            style: Theme.of(context).primaryTextTheme.subhead,
          ),
        ),
        Container(
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.only(
            top: 24,
            bottom: 24,
          ),
          color: Theme.of(context).backgroundColor.withOpacity(0.5),
          child: FractionallySizedBox(
            widthFactor: 0.75,
            child: CameraControlsProvider(
              builder: (BuildContext context, CameraControlsState state) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    CameraButton(
                      icon: state.flashButtonIcon,
                    ),
                    CameraButton(
                      icon: state.mainButtonIcon,
                      onLongPress: onCameraButtonLongPress,
                      onPressed: state.isMainButtonEnabled
                          ? onCameraButtonPressed
                          : null,
                      size: 80,
                    ),
                    CameraButton(
                      icon: state.flipButtonIcon,
                      onPressed: state.isFlipButtonEnabled
                          ? onFlipCameraButtonPressed
                          : null,
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ],
    );
  }

  void onCameraButtonPressed() async {
    if (cameraControlsState.isRecording) {
      _stopVideoRecording();
    } else {
      _takePicture();
    }
  }

  void onCameraButtonLongPress() async {
    store.dispatch(StartVideoRecording());

    try {
      final videoPath = await Singleton.fileService.videPath;
      await controller.startVideoRecording(videoPath);
    } catch (e) {
      print(e);
    }
  }

  void onFlipCameraButtonPressed() {}

  void _disableSecondaryButtons() {
    store.dispatch(DisableFlipButton());
    store.dispatch(DisableFlashButton());
  }

  void _enableSecondaryButtons() {
    store.dispatch(EnableFlashButton());
    store.dispatch(EnableFlipButton());
  }

  void _takePicture() async {
    _disableSecondaryButtons();

    try {
      final imagePath = await Singleton.fileService.imagePath;
      await controller.takePicture(imagePath);
      store.dispatch(
        AddFilePath(filePath: imagePath),
      );
    } catch (e) {
      print(e);
    } finally {
      _enableSecondaryButtons();
    }
  }

  void _stopVideoRecording() async {
    await controller.stopVideoRecording();
    store.dispatch(StopVideoRecording());
  }

  CameraControlsState get cameraControlsState =>
      store.state.cameraControlsState;
}
