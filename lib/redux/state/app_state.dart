import 'package:flutter/material.dart';
import 'package:flutter_whats_clone/redux/state/camera_controls_state.dart';
import 'package:flutter_whats_clone/redux/state/camera_miniatures_state.dart';
import 'package:flutter_whats_clone/redux/state/camera_state.dart';
import 'package:flutter_whats_clone/redux/state/chat_state.dart';
import 'package:flutter_whats_clone/redux/state/messages_state.dart';

class AppState {
  final ChatState chatState;
  final MessageState messageState;
  final CameraControlsState cameraControlsState;
  final CameraMiniaturesState cameraMiniaturesState;
  final CameraState cameraState;

  AppState({
    @required this.chatState,
    @required this.messageState,
    @required this.cameraControlsState,
    @required this.cameraMiniaturesState,
    @required this.cameraState,
  });

  factory AppState.initial() => AppState(
        chatState: ChatState.initial(),
        messageState: MessageState.initial(),
        cameraControlsState: CameraControlsState.initial(),
        cameraMiniaturesState: CameraMiniaturesState.initial(),
        cameraState: CameraState.initial(),
      );

  AppState copy({
    ChatState chatState,
    MessageState messageState,
    CameraControlsState cameraControlsState,
    CameraMiniaturesState cameraMiniaturesState,
    CameraState cameraState,
  }) {
    return AppState(
      chatState: chatState ?? this.chatState,
      messageState: messageState ?? this.messageState,
      cameraControlsState: cameraControlsState ?? this.cameraControlsState,
      cameraMiniaturesState:
          cameraMiniaturesState ?? this.cameraMiniaturesState,
      cameraState: cameraState ?? this.cameraState,
    );
  }
}
