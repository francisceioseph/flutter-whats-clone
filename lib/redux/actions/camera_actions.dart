import 'package:async_redux/async_redux.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_whats_clone/redux/state/app_state.dart';
import 'package:flutter_whats_clone/redux/state/camera_state.dart';

class InitCameraPlugin extends ReduxAction<AppState> {
  AppState reduce() {
    WidgetsFlutterBinding.ensureInitialized();

    store.dispatch(ListCameras());
    return null;
  }
}

class ListCameras extends ReduxAction<AppState> {
  Future<AppState> reduce() async {
    final cameras = await availableCameras();

    store.dispatch(InitCamera(cameras: cameras));

    return null;
  }
}

class InitCamera extends ReduxAction<AppState> {
  List<CameraDescription> cameras;

  InitCamera({@required this.cameras});

  Future<AppState> reduce() async {
    final cameraState = store.state.cameraState;
    final camera = cameras[0];
    final controller = CameraController(
      camera,
      ResolutionPreset.ultraHigh,
    );

    await controller.initialize();

    return store.state.copy(
      cameraState: cameraState.copy(
        cameraIndex: 0,
        cameras: this.cameras,
        camera: camera,
        controller: controller,
      ),
    );
  }
}

class FlipCamera extends ReduxAction<AppState> {
  Future<AppState> reduce() async {
    final cameraState = store.state.cameraState;

    await cameraState.controller.dispose();

    if (cameraState.cameras.length < 2) {
      return null;
    }

    final cameraIndex = cameraState.cameraIndex == 0 ? 1 : 0;
    final camera = cameraState.cameras[cameraIndex];

    final controller = CameraController(
      camera,
      ResolutionPreset.ultraHigh,
    );

    await controller.initialize();

    return store.state.copy(
      cameraState: cameraState.copy(
        cameraIndex: cameraIndex,
        camera: camera,
        controller: controller,
      ),
    );
  }
}

class DisposeCamera extends ReduxAction<AppState> {
  Future<AppState> reduce() async {
    await store.state.cameraState.controller.dispose();

    return store.state.copy(cameraState: CameraState.initial());
  }
}
