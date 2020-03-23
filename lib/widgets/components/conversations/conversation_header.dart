import 'package:flutter/material.dart';

class ConversationSectionHeader extends StatelessWidget {
  final IconData leadingIcon;
  final String headerText;

  ConversationSectionHeader({
    @required this.headerText,
    @required this.leadingIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).scaffoldBackgroundColor,
      child: Row(
        children: <Widget>[
          Container(
            margin: EdgeInsets.all(12),
            child: Icon(this.leadingIcon),
          ),
          Text(
            this.headerText,
            style: Theme.of(context)
                .primaryTextTheme
                .subhead
                .copyWith(fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
