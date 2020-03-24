import 'package:flutter/material.dart';
import 'package:flutter_whats_clone/redux/actions/chats_actions.dart';
import 'package:flutter_whats_clone/redux/store.dart';
import 'package:flutter_whats_clone/widgets/pages/chat_page.dart';
import 'package:flutter_whats_clone/widgets/pages/messages_page.dart';

class AppRouter {
  MaterialPageRoute onGenerateRoute(RouteSettings settings) {
    return MaterialPageRoute(
      builder: (BuildContext context) {
        if (settings.name == MessagesPage.routeName) {
          return MessagesPage();
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
