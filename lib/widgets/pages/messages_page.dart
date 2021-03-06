import 'package:flutter/material.dart';
import 'package:flutter_whats_clone/models/chat.dart';
import 'package:flutter_whats_clone/redux/view_models/message_vm.dart';
import 'package:flutter_whats_clone/widgets/components/messages/message_form.dart';
import 'package:flutter_whats_clone/widgets/components/messages/message_list.dart';
import 'package:flutter_whats_clone/widgets/connectors/messages_connector.dart';

class MessagesPage extends StatelessWidget {
  static final String routeName = '/messages';

  final Chat chat;

  MessagesPage({
    @required this.chat,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: ListTile(
          title: Text(
            chat.userName,
            style: Theme.of(context).primaryTextTheme.title,
          ),
          subtitle: Text('online'),
        ),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: MessagesConnector(
              chatId: chat.id,
              builder: (BuildContext context, MessagesViewModel vm) {
                return Container(
                  margin: EdgeInsets.only(
                    right: 16,
                    left: 16,
                  ),
                  child: MessageList(
                    messages: vm.messages,
                  ),
                );
              },
            ),
          ),
          MessageForm(),
        ],
      ),
    );
  }
}
