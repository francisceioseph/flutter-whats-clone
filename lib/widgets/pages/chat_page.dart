import 'package:flutter/material.dart';
import 'package:flutter_whats_clone/redux/view_models/chats_vm.dart';
import 'package:flutter_whats_clone/widgets/components/conversations/conversation_group.dart';
import 'package:flutter_whats_clone/widgets/connectors/chats_connector.dart';

class ChatPage extends StatelessWidget {
  static final routeName = '/';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chats'),
      ),
      body: ChatsConnector(
        builder: (BuildContext context, ChatsViewModel vm) {
          return ConversationGroup(
            chatGroup: vm.chats,
          );
        },
      ),
    );
  }
}
