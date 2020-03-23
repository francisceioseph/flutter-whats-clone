import 'package:flutter/material.dart';
import 'package:flutter_whats_clone/widgets/pages/chat_page.dart';

class AppRouter {
  MaterialPageRoute onGenerateRoute(RouteSettings settings) {
    return MaterialPageRoute(
      builder: (BuildContext context) {
        return ChatPage();
      },
    );
  }
}
