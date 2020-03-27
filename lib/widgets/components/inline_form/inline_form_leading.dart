import 'package:flutter/material.dart';

class InlineFormLeading extends StatelessWidget {
  final IconData icon;
  final void Function() onPressed;

  InlineFormLeading({
    this.icon = Icons.add,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        right: 16,
        left: 4,
      ),
      child: CircleAvatar(
        child: IconButton(
          icon: Icon(Icons.add),
          onPressed: onPressed,
        ),
      ),
    );
  }
}
