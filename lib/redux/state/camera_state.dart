import 'package:camera/camera.dart';

class CameraState {
  final List<CameraDescription> cameras;
  final CameraDescription camera;
  final CameraController controller;
  final int cameraIndex;

  CameraState({
    this.cameras,
    this.camera,
    this.controller,
    this.cameraIndex,
  });

  factory CameraState.initial() => CameraState(
        cameras: [],
        cameraIndex: 0,
      );

  CameraState copy({
    List<CameraDescription> cameras,
    CameraDescription camera,
    CameraController controller,
    int cameraIndex,
  }) {
    return CameraState(
      cameras: cameras ?? this.cameras,
      camera: camera ?? this.camera,
      controller: controller ?? this.controller,
      cameraIndex: cameraIndex ?? this.cameraIndex,
    );
  }
}
