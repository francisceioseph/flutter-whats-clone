import 'dart:io';

import 'package:flutter/material.dart';

class CameraMiniaturesState {
  final List<File> images;

  CameraMiniaturesState({
    @required this.images,
  });

  factory CameraMiniaturesState.initial() => CameraMiniaturesState(
        images: [],
      );

  CameraMiniaturesState copy({
    List<File> images,
  }) {
    return CameraMiniaturesState(
      images: images ?? this.images,
    );
  }
}
