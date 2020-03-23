import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class ConversationItem extends StatelessWidget {
  final bool isPinned;

  ConversationItem({
    this.isPinned = false,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Slidable(
      actionPane: SlidableDrawerActionPane(),
      child: ListTile(
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
      ),
      actions: <Widget>[
        IconSlideAction(
          caption: 'Read',
          color: theme.accentColor.withOpacity(0.8),
          icon: Icons.check_circle_outline,
        ),
      ],
    );
  }
}
