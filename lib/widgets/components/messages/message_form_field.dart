import 'package:flutter/material.dart';

class MessageFormField extends StatelessWidget {
  final TextEditingController controller;
  final void Function(String) onChanged;

  MessageFormField({
    @required this.controller,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      maxLength: null,
      minLines: 1,
      maxLines: 2,
      onChanged: onChanged,
      decoration: InputDecoration(
        border: InputBorder.none,
        focusedBorder: InputBorder.none,
        enabledBorder: InputBorder.none,
        errorBorder: InputBorder.none,
        focusedErrorBorder: InputBorder.none,
        disabledBorder: InputBorder.none,
      ),
    );
  }
}
