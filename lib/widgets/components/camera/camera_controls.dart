import 'package:flutter/material.dart';
import 'package:flutter_whats_clone/widgets/components/camera/camera_button.dart';

class CameraControls extends StatelessWidget {
  final int currentCameraIndex;
  final void Function() onCameraButtonPressed;
  final void Function() onFlipCameraButtonPressed;

  CameraControls({
    this.currentCameraIndex,
    this.onCameraButtonPressed,
    this.onFlipCameraButtonPressed,
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
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                CameraButton(
                  icon: Icons.flash_on,
                ),
                CameraButton(
                  icon: Icons.radio_button_unchecked,
                  onPressed: onCameraButtonPressed,
                  size: 80,
                ),
                CameraButton(
                  icon: _flipCameraIcon,
                  onPressed: onFlipCameraButtonPressed,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  get _flipCameraIcon =>
      this.currentCameraIndex == 0 ? Icons.camera_front : Icons.camera_rear;
}
