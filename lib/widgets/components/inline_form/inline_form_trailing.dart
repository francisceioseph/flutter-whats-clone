import 'package:flutter/material.dart';

class InlineFormTrailing extends StatelessWidget {
  final IconData icon;
  final void Function() onPressed;

  InlineFormTrailing({
    @required this.icon,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        right: 8,
      ),
      decoration: BoxDecoration(
        color: Colors.teal[700],
        borderRadius: BorderRadius.all(Radius.circular(32)),
      ),
      child: Listener(
        child: IconButton(
          icon: Icon(icon),
          onPressed: onPressed,
        ),
      ),
    );
  }
}
