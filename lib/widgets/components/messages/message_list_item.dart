import 'package:flutter/material.dart';

class MessageListItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      widthFactor: 0.75,
      alignment: Alignment.centerRight,
      child: Container(
        margin: EdgeInsets.all(8),
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          border: Border.all(
            color: Theme.of(context).accentColor,
          ),
          borderRadius: BorderRadius.all(Radius.circular(16)),
        ),
        child: Text('lorem ipsum dolor'),
      ),
    );
  }
}
