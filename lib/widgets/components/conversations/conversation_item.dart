import 'package:flutter/material.dart';

class ConversationItem extends StatelessWidget {
  final bool isPinned;

  ConversationItem({
    this.isPinned = false,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(),
      title: Text('username'),
      subtitle: Text('lorem ipsum dolor in si amet...'),
      trailing: Container(
        child: Column(
          children: <Widget>[
            if (this.isPinned) Icon(Icons.pin_drop),
            Text('Jun 8'),
          ],
        ),
      ),
    );
  }
}
