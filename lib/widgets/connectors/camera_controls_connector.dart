import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_whats_clone/redux/state/app_state.dart';
import 'package:flutter_whats_clone/redux/state/camera_controls_state.dart';

class CameraControlsConnector extends StatelessWidget {
  final Widget Function(BuildContext, CameraControlsState) builder;

  CameraControlsConnector({
    @required this.builder,
  });

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, CameraControlsState>(
      converter: (store) => store.state.cameraControlsState,
      builder: this.builder,
    );
  }
}
