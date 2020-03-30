import 'package:flutter/material.dart';

class InlineFormTrailing extends StatelessWidget {
  final IconData icon;
  final void Function() onPressed;
  final void Function(TapDownDetails) onTapDown;

  InlineFormTrailing({
    @required this.icon,
    this.onPressed,
    this.onTapDown,
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
      child: GestureDetector(
        onTapDown: onTapDown,
        child: IconButton(
          icon: Icon(icon),
          onPressed: onPressed,
        ),
      ),
    );
  }
}
