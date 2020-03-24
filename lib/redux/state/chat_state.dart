import 'package:flutter/material.dart';
import 'package:flutter_whats_clone/models/chat_group.dart';

class ChatState {
  static final ChatGroup defaultState = ChatGroup();

  final ChatGroup chatGroup;

  ChatState({
    @required this.chatGroup,
  });

  factory ChatState.initial() => ChatState(
        chatGroup: defaultState,
      );

  ChatState copy({
    ChatGroup chatGroup,
  }) {
    return ChatState(
      chatGroup: chatGroup ?? this.chatGroup,
    );
  }
}
