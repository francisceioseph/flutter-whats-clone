import 'package:flutter/material.dart';
import 'package:flutter_whats_clone/widgets/components/inline_form/inline_form_leading.dart';
import 'package:flutter_whats_clone/widgets/components/inline_form/inline_form_text_field.dart';
import 'package:flutter_whats_clone/widgets/components/inline_form/inline_form_trailing.dart';

class InlineForm extends StatefulWidget {
  final IconData leadingIcon;
  final void Function() onLeadingButtonPressed;

  final IconData trailingIcon;
  final void Function() onTrailingButtonPressed;
  final void Function(TapDownDetails) onTrailingButtonTapDown;

  final TextEditingController controller;
  final void Function(String) onValueChange;

  final List<Widget> textFieldTrailing;

  InlineForm({
    this.controller,
    this.trailingIcon = Icons.check,
    this.leadingIcon = Icons.add,
    this.onLeadingButtonPressed,
    this.onTrailingButtonPressed,
    this.onTrailingButtonTapDown,
    this.onValueChange,
    this.textFieldTrailing = const [],
  });

  @override
  _InlineFormState createState() => _InlineFormState();
}

class _InlineFormState extends State<InlineForm> {
  String content = '';
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Form(
        key: _formKey,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Expanded(
              child: Container(
                margin: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  border: Border.all(color: Theme.of(context).accentColor),
                  borderRadius: BorderRadius.all(Radius.circular(64)),
                ),
                child: Row(
                  children: <Widget>[
                    InlineFormLeading(
                      icon: widget.leadingIcon,
                      onPressed: widget.onLeadingButtonPressed,
                    ),
                    InlineFormTextField(
                      controller: widget.controller,
                      onValueChange: widget.onValueChange,
                    ),
                    ...widget.textFieldTrailing,
                  ],
                ),
              ),
            ),
            InlineFormTrailing(
              icon: widget.trailingIcon,
              onPressed: widget.onTrailingButtonPressed,
              onTapDown: widget.onTrailingButtonTapDown,
            ),
          ],
        ),
      ),
    );
  }
}
