import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:flutter_whats_clone/models/message.dart';

class MessagesRepository {
  Future<List<Message>> loadMessages({String chatId}) async {
    final String rawMessagesList = await rootBundle.loadString(
      'assets/mocks/messages.json',
    );

    final List<dynamic> messages = json.decode(rawMessagesList);

    return messages
        .where((m) => m['conversation_id'] == chatId)
        .map((m) => Message.fromJson(m))
        .toList();
  }
}
