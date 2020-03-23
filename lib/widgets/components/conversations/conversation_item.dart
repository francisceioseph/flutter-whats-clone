import 'package:flutter/material.dart';

class ConversationItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(),
      title: Text('username'),
      subtitle: Text('lorem ipsum dolor in si amet...'),
    );
  }
}
