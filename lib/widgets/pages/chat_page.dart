import 'package:flutter/material.dart';
import 'package:flutter_whats_clone/widgets/components/conversations/conversation_group.dart';

class ChatPage extends StatelessWidget {
  static final routeName = '/';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chats'),
      ),
      body: ConversationGroup(
        conversations: {},
      ),
    );
  }
}
