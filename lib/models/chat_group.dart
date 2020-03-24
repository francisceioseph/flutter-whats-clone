import 'package:flutter_whats_clone/models/chat.dart';

class ChatGroup {
  final List<Chat> all;
  final List<Chat> pinned;

  ChatGroup({
    this.all = const [],
    this.pinned = const [],
  });
}
