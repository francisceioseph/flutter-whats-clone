import 'package:flutter/material.dart';
import 'package:async_redux/async_redux.dart';
import 'package:flutter_whats_clone/redux/state/app_state.dart';
import 'package:flutter_whats_clone/redux/state/camera_state.dart';

class CameraProvider extends StatelessWidget {
  final Widget Function(BuildContext, CameraState) builder;

  CameraProvider({
    @required this.builder,
  });

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, CameraState>(
      converter: (store) => store.state.cameraState,
      builder: this.builder,
    );
  }
}
