import 'package:flutter/material.dart';
import 'package:flutter_whats_clone/widgets/components/messages/message_form_field.dart';
import 'package:flutter_whats_clone/widgets/components/messages/message_form_main_button.dart';
import 'package:flutter_whats_clone/widgets/pages/camera_page.dart';

class MessageForm extends StatefulWidget {
  @override
  _MessageFormState createState() => _MessageFormState();
}

class _MessageFormState extends State<MessageForm> {
  String _content = '';
  IconData _mainButtonIcon = Icons.mic;

  final _formKey = GlobalKey<FormState>();
  final _controller = TextEditingController(text: '');

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
                margin: EdgeInsets.only(
                  top: 16,
                  bottom: 16,
                  right: 8,
                  left: 8,
                ),
                decoration: BoxDecoration(
                  border: Border.all(color: Theme.of(context).accentColor),
                  borderRadius: BorderRadius.all(Radius.circular(64)),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(
                        right: 16,
                        left: 4,
                      ),
                      child: CircleAvatar(
                        child: IconButton(
                          icon: Icon(Icons.add),
                          onPressed: null,
                        ),
                      ),
                    ),
                    Expanded(
                        child: MessageFormField(
                      controller: _controller,
                      onChanged: _onInputContentChange,
                    )),
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
                ),
              ),
            ),
            MessageFormMainButton(
              icon: _mainButtonIcon,
              onPressed: _onMainButtonPressed,
            )
          ],
        ),
      ),
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
