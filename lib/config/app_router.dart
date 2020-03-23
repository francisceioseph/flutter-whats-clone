import 'package:flutter/material.dart';
import 'package:flutter_whats_clone/widgets/pages/chat_page.dart';
import 'package:flutter_whats_clone/widgets/pages/messages_page.dart';

class AppRouter {
  MaterialPageRoute onGenerateRoute(RouteSettings settings) {
    return MaterialPageRoute(
      builder: (BuildContext context) {
        if (settings.name == MessagesPage.routeName) {
          return MessagesPage();
        }

        return ChatPage();
      },
    );
  }
}
