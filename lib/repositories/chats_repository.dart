import 'dart:convert';

import 'package:flutter/services.dart';

class ChatsRepository {
  Future<List<dynamic>> loadChats() async {
    final String rawChatList = await rootBundle.loadString(
      'assets/mocks/chats.json',
    );

    return json.decode(rawChatList);
  }
}
