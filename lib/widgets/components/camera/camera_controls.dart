import 'package:flutter/material.dart';

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
    return Container(
      padding: EdgeInsets.only(
        top: 32,
        bottom: 32,
      ),
      color: Theme.of(context).backgroundColor.withOpacity(0.5),
      child: FractionallySizedBox(
        widthFactor: 0.75,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            FloatingActionButton(
              mini: true,
              child: Icon(Icons.flash_on),
              onPressed: null,
            ),
            FloatingActionButton(
              child: Icon(Icons.radio_button_unchecked),
              onPressed: onCameraButtonPressed,
            ),
            FloatingActionButton(
              mini: true,
              child: Icon(_flipCameraIcon),
              onPressed: onFlipCameraButtonPressed,
            ),
          ],
        ),
      ),
    );
  }

  get _flipCameraIcon =>
      this.currentCameraIndex == 0 ? Icons.camera_front : Icons.camera_rear;
}
