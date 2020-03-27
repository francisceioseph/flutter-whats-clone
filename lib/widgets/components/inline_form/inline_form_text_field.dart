import 'package:flutter/material.dart';

class InlineFormTextField extends StatelessWidget {
  final TextEditingController controller;
  final void Function(String) onValueChange;

  InlineFormTextField({
    @required this.controller,
    @required this.onValueChange,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Expanded(
        child: TextFormField(
          controller: controller,
          maxLength: null,
          minLines: 1,
          maxLines: 2,
          onChanged: onValueChange,
          decoration: InputDecoration(
            border: InputBorder.none,
            focusedBorder: InputBorder.none,
            enabledBorder: InputBorder.none,
            errorBorder: InputBorder.none,
            focusedErrorBorder: InputBorder.none,
            disabledBorder: InputBorder.none,
          ),
        ),
      ),
    );
  }
}
