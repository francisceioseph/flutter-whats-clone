import 'package:flutter/material.dart';
import 'package:flutter_whats_clone/models/message.dart';

class MessageListItem extends StatelessWidget {
  static const kUserId = '56bc250ae47f';

  final Message previous;
  final Message current;
  final Message next;

  MessageListItem({
    this.previous,
    this.current,
    this.next,
  });

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      widthFactor: 0.75,
      alignment: bubbleAlignment(current),
      child: Container(
        margin: EdgeInsets.all(4),
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          border: Border.all(
            color: Theme.of(context).accentColor,
          ),
          borderRadius: bubbleBorderRadius,
        ),
        child: Text('lorem ipsum dolor'),
      ),
    );
  }

  Alignment bubbleAlignment(Message message) =>
      isFromMe ? Alignment.centerRight : Alignment.centerLeft;

  BorderRadius get bubbleBorderRadius {
    if (previous == null) {
      return isFromMe ? radiusTopFromMe : radiusTopFromOther;
    }

    if (next == null) {
      return isFromMe ? radiusBottomFromMe : radiusBottomFromOther;
    }

    if (previous.from == current.from && previous.from == next.from) {
      return isFromMe ? radiusMiddleFromMe : radiusMiddleFromOther;
    }

    if (previous.from != current.from) {
      return isFromMe ? radiusTopFromMe : radiusTopFromOther;
    }

    return isFromMe ? radiusBottomFromMe : radiusBottomFromOther;
  }

  bool get isFromMe => current.from == kUserId;

  BorderRadiusGeometry get radiusTopFromMe => BorderRadius.only(
        topLeft: Radius.circular(16),
        topRight: Radius.circular(16),
        bottomLeft: Radius.circular(4),
        bottomRight: Radius.circular(4),
      );

  BorderRadiusGeometry get radiusMiddleFromMe => BorderRadius.only(
        topLeft: Radius.circular(4),
        topRight: Radius.circular(4),
        bottomLeft: Radius.circular(4),
        bottomRight: Radius.circular(4),
      );

  BorderRadiusGeometry get radiusBottomFromMe => BorderRadius.only(
        topLeft: Radius.circular(4),
        topRight: Radius.circular(4),
        bottomRight: Radius.circular(16),
        bottomLeft: Radius.circular(16),
      );

  BorderRadiusGeometry get radiusTopFromOther => BorderRadius.only(
        topRight: Radius.circular(16),
        topLeft: Radius.circular(16),
        bottomRight: Radius.circular(4),
        bottomLeft: Radius.circular(4),
      );

  BorderRadiusGeometry get radiusMiddleFromOther => BorderRadius.only(
        topLeft: Radius.circular(4),
        topRight: Radius.circular(4),
        bottomLeft: Radius.circular(4),
        bottomRight: Radius.circular(4),
      );

  BorderRadiusGeometry get radiusBottomFromOther => BorderRadius.only(
        topRight: Radius.circular(4),
        bottomRight: Radius.circular(16),
        topLeft: Radius.circular(4),
        bottomLeft: Radius.circular(16),
      );
}
