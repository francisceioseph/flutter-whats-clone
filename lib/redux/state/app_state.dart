import 'package:flutter/material.dart';
import 'package:flutter_whats_clone/redux/state/chat_state.dart';
import 'package:flutter_whats_clone/redux/state/messages_state.dart';

class AppState {
  final ChatState chatState;
  final MessageState messageState;

  AppState({
    @required this.chatState,
    @required this.messageState,
  });

  factory AppState.initial() => AppState(
        chatState: ChatState.initial(),
        messageState: MessageState.initial(),
      );

  AppState copy({
    ChatState chatState,
    MessageState messageState,
  }) {
    return AppState(
      chatState: chatState ?? this.chatState,
      messageState: messageState ?? this.messageState,
    );
  }
}
