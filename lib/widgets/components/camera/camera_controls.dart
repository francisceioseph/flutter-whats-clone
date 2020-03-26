import 'package:flutter/material.dart';
import 'package:flutter_whats_clone/redux/state/camera_controls_state.dart';
import 'package:flutter_whats_clone/widgets/components/camera/camera_button.dart';
import 'package:flutter_whats_clone/widgets/providers/camera_controls_provider.dart';

class CameraControls extends StatelessWidget {
  final void Function() onCameraButtonPressed;
  final void Function() onFlipCameraButtonPressed;

  CameraControls({
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
                CameraControlsProvider(
                  builder: (BuildContext context, CameraControlsState state) {
                    return CameraButton(
                      icon: state.flashButtonIcon,
                    );
                  },
                ),
                CameraControlsProvider(
                  builder: (BuildContext context, CameraControlsState state) {
                    return CameraButton(
                      icon: state.mainButtonIcon,
                      onPressed: state.isMainButtonEnabled
                          ? onCameraButtonPressed
                          : null,
                      size: 80,
                    );
                  },
                ),
                CameraControlsProvider(
                  builder: (BuildContext context, CameraControlsState state) {
                    return CameraButton(
                      icon: state.flipButtonIcon,
                      onPressed: state.isFlipButtonEnabled
                          ? onFlipCameraButtonPressed
                          : null,
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
