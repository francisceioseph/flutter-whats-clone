import 'package:flutter/material.dart';
import 'package:flutter_whats_clone/widgets/components/messages/message_form.dart';
import 'package:flutter_whats_clone/widgets/components/messages/message_list.dart';

class MessagesPage extends StatelessWidget {
  static final String routeName = '/messages';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Messages"),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Expanded(
              child: MessageList(),
            ),
            MessageForm(),
          ],
        ),
      ),
    );
  }
}
