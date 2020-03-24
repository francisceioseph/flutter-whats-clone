import 'package:flutter/material.dart';
import 'package:flutter_whats_clone/models/chat.dart';
import 'package:flutter_whats_clone/redux/actions/chats_actions.dart';
import 'package:flutter_whats_clone/redux/actions/messages_router.dart';
import 'package:flutter_whats_clone/redux/store.dart';
import 'package:flutter_whats_clone/widgets/pages/chat_page.dart';
import 'package:flutter_whats_clone/widgets/pages/messages_page.dart';

class AppRouter {
  MaterialPageRoute onGenerateRoute(RouteSettings settings) {
    return MaterialPageRoute(
      builder: (BuildContext context) {
        if (settings.name == MessagesPage.routeName) {
          final Chat chat = settings.arguments;
          store.dispatch(LoadMessages(chatId: chat.id));

          return MessagesPage(chat: chat);
        }

        if (settings.name == ChatPage.routeName) {
          store.dispatch(LoadChats());
          return ChatPage();
        }

        return ChatPage();
      },
    );
  }
}
