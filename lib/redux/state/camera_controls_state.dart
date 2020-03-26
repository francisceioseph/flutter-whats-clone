import 'package:flutter/material.dart';

class CameraControlsState {
  final bool isRecording;
  final bool isMainButtonEnabled;
  final bool isFlipButtonEnabled;
  final bool isFlashButtonEnabled;

  final IconData mainButtonIcon;
  final IconData flipButtonIcon;
  final IconData flashButtonIcon;

  CameraControlsState({
    this.isRecording = false,
    this.isMainButtonEnabled = true,
    this.isFlipButtonEnabled = true,
    this.isFlashButtonEnabled = true,
    this.mainButtonIcon = Icons.radio_button_unchecked,
    this.flipButtonIcon = Icons.camera_front,
    this.flashButtonIcon = Icons.flash_on,
  });

  factory CameraControlsState.initial() => CameraControlsState();

  CameraControlsState copy({
    bool isRecording,
    bool isMainButtonEnabled,
    bool isFlipButtonEnabled,
    bool isFlashButtonEnabled,
    IconData mainButtonIcon,
    IconData flipButtonIcon,
    IconData flashButtonIcon,
  }) {
    return CameraControlsState(
      isRecording: isRecording ?? this.isRecording,
      isMainButtonEnabled: isMainButtonEnabled ?? this.isMainButtonEnabled,
      isFlipButtonEnabled: isFlipButtonEnabled ?? this.isFlipButtonEnabled,
      isFlashButtonEnabled: isFlashButtonEnabled ?? this.isFlashButtonEnabled,
      mainButtonIcon: mainButtonIcon ?? this.mainButtonIcon,
      flipButtonIcon: flipButtonIcon ?? this.flipButtonIcon,
      flashButtonIcon: flashButtonIcon ?? this.flashButtonIcon,
    );
  }
}
