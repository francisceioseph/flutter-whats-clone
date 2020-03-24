import 'package:flutter/material.dart';

class ChatState {
  static final defaultState = {
    'pinned': [],
    'all': [],
  };

  final Map<String, List<dynamic>> chats;

  ChatState({
    @required this.chats,
  });

  factory ChatState.initial() => ChatState(
        chats: defaultState,
      );

  ChatState copy({
    Map<String, List<dynamic>> conversations,
  }) {
    return ChatState(
      chats: conversations ?? this.chats,
    );
  }
}
