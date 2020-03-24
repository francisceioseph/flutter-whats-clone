import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_whats_clone/models/chat.dart';
import 'package:flutter_whats_clone/widgets/pages/messages_page.dart';

class ConversationItem extends StatelessWidget {
  final Chat chat;

  ConversationItem({@required this.chat});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Slidable(
      actionPane: SlidableDrawerActionPane(),
      child: ListTile(
        leading: CircleAvatar(),
        title: Text(
          chat.userName,
          style: theme.primaryTextTheme.subhead.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Text(
          chat.lastMessgeResume,
          overflow: TextOverflow.ellipsis,
        ),
        trailing: Container(
          child: Column(
            children: <Widget>[
              if (this.chat.pinned) Icon(Icons.pin_drop),
              Text('Jun 8'),
            ],
          ),
        ),
        onTap: () {
          Navigator.of(context).pushNamed(MessagesPage.routeName);
        },
      ),
      actions: <Widget>[
        IconSlideAction(
          caption: 'Read',
          color: theme.accentColor.withOpacity(0.8),
          icon: Icons.check_circle_outline,
        ),
      ],
      secondaryActions: <Widget>[
        IconSlideAction(
          caption: 'Delete',
          color: Colors.red,
          icon: Icons.delete_outline,
        )
      ],
    );
  }
}
