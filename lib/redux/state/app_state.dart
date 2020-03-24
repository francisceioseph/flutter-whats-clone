import 'package:flutter/material.dart';
import 'package:flutter_whats_clone/redux/state/chat_state.dart';

class AppState {
  final ChatState chatState;

  AppState({
    @required this.chatState,
  });

  factory AppState.initial() => AppState(
        chatState: ChatState.initial(),
      );

  AppState copy({
    ChatState chatState,
  }) {
    return AppState(
      chatState: chatState ?? this.chatState,
    );
  }
}
