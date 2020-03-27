import 'package:flutter/material.dart';
import 'package:flutter_whats_clone/widgets/components/inline_form/inline_form.dart';
import 'package:flutter_whats_clone/widgets/pages/camera_page.dart';

class MessageForm extends StatefulWidget {
  @override
  _MessageFormState createState() => _MessageFormState();
}

class _MessageFormState extends State<MessageForm> {
  String _content = '';
  IconData _mainButtonIcon = Icons.mic;

  final _controller = TextEditingController(text: '');

  @override
  Widget build(BuildContext context) {
    return InlineForm(
      controller: _controller,
      trailingIcon: _mainButtonIcon,
      onValueChange: _onInputContentChange,
      onTrailingButtonPressed: _onMainButtonPressed,
      textFieldTrailing: <Widget>[
        IconButton(
          icon: Icon(Icons.attach_file),
          onPressed: null,
        ),
        IconButton(
          icon: Icon(Icons.camera_alt),
          onPressed: () {
            Navigator.of(context).pushNamed(CameraPage.routeName);
          },
        ),
      ],
    );
  }

  void _onInputContentChange(String value) {
    setState(() {
      _content = value;
      _mainButtonIcon = _content == '' ? Icons.mic : Icons.send;
    });
  }

  void _onMainButtonPressed() {
    setState(() {
      _content = '';
      _mainButtonIcon = Icons.mic;
    });

    _controller.clear();
  }
}
