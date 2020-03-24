import 'package:flutter/material.dart';

class MessageFormMainButton extends StatelessWidget {
  final IconData icon;
  final void Function() onPressed;

  MessageFormMainButton({
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
        color: Colors.black,
        borderRadius: BorderRadius.all(Radius.circular(32)),
      ),
      child: IconButton(
        icon: Icon(icon),
        onPressed: onPressed,
      ),
    );
  }
}
