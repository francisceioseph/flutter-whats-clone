import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_whats_clone/redux/state/app_state.dart';

class EnableMainButton extends ReduxAction<AppState> {
  AppState reduce() {
    final state = store.state.cameraControlsState;
    final newState = state.copy(isMainButtonEnabled: true);

    return store.state.copy(cameraControlsState: newState);
  }
}

class DisableMainButton extends ReduxAction<AppState> {
  AppState reduce() {
    final state = store.state.cameraControlsState;
    final newState = state.copy(isMainButtonEnabled: false);

    return store.state.copy(cameraControlsState: newState);
  }
}

class EnableFlipButton extends ReduxAction<AppState> {
  AppState reduce() {
    final state = store.state.cameraControlsState;
    final newState = state.copy(isFlipButtonEnabled: true);

    return store.state.copy(cameraControlsState: newState);
  }
}

class DisableFlipButton extends ReduxAction<AppState> {
  AppState reduce() {
    final state = store.state.cameraControlsState;
    final newState = state.copy(isFlipButtonEnabled: false);

    return store.state.copy(cameraControlsState: newState);
  }
}

class ToggleFlipButton extends ReduxAction<AppState> {
  AppState reduce() {
    final state = store.state.cameraControlsState;
    final newIcon = state.flipButtonIcon == Icons.camera_front
        ? Icons.camera_rear
        : Icons.camera_front;

    final newState = state.copy(flipButtonIcon: newIcon);

    return store.state.copy(cameraControlsState: newState);
  }
}

class EnableFlashButton extends ReduxAction<AppState> {
  AppState reduce() {
    final state = store.state.cameraControlsState;
    final newState = state.copy(isFlashButtonEnabled: true);

    return store.state.copy(cameraControlsState: newState);
  }
}

class DisableFlashButton extends ReduxAction<AppState> {
  AppState reduce() {
    final state = store.state.cameraControlsState;
    final newState = state.copy(isFlashButtonEnabled: false);

    return store.state.copy(cameraControlsState: newState);
  }
}

class StartVideoRecording extends ReduxAction<AppState> {
  AppState reduce() {
    final state = store.state.cameraControlsState;
    final newState = state.copy(
      isRecording: true,
      isFlashButtonEnabled: false,
      isFlipButtonEnabled: false,
      mainButtonIcon: Icons.stop,
    );

    return store.state.copy(cameraControlsState: newState);
  }
}

class StopVideoRecording extends ReduxAction<AppState> {
  AppState reduce() {
    final state = store.state.cameraControlsState;
    final newState = state.copy(
      isRecording: false,
      isFlashButtonEnabled: true,
      isFlipButtonEnabled: true,
      mainButtonIcon: Icons.radio_button_unchecked,
    );

    return store.state.copy(cameraControlsState: newState);
  }
}
