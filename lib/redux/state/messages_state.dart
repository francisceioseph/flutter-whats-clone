import 'package:flutter/cupertino.dart';
import 'package:flutter_whats_clone/models/message.dart';

class MessageState {
  static final Map<String, List<Message>> defaultState = {};

  final Map<String, List<Message>> messageGroup;

  MessageState({
    @required this.messageGroup,
  });

  factory MessageState.initial() => MessageState(
        messageGroup: defaultState,
      );

  MessageState copy({
    Map<String, List<Message>> messageGroup,
  }) {
    return MessageState(
      messageGroup: messageGroup ?? this.messageGroup,
    );
  }
}
