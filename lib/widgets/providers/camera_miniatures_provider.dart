import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_whats_clone/redux/state/app_state.dart';
import 'package:flutter_whats_clone/redux/state/camera_miniatures_state.dart';

class CameraMiniaturesProvider extends StatelessWidget {
  final Widget Function(BuildContext, CameraMiniaturesState) builder;

  CameraMiniaturesProvider({
    @required this.builder,
  });

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, CameraMiniaturesState>(
      converter: (store) => store.state.cameraMiniaturesState,
      builder: this.builder,
    );
  }
}
