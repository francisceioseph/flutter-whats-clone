import 'dart:io';
import 'dart:math';

import 'package:audio_recorder/audio_recorder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_whats_clone/services/singleton.dart';
import 'package:flutter_whats_clone/widgets/components/inline_form/inline_form.dart';
import 'package:flutter_whats_clone/widgets/components/share_media/share_media_grid.dart';
import 'package:flutter_whats_clone/widgets/pages/camera_page.dart';
import 'package:path/path.dart';

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
      onTrailingButtonTapDown: _trailingButtonTapDownHandler,
      textFieldTrailing: <Widget>[
        IconButton(
          icon: Transform.rotate(
            angle: pi / 2,
            child: Icon(
              Icons.attach_file,
            ),
          ),
          onPressed: () => _openShareActionSheet(context),
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

  void _trailingButtonTapDownHandler(TapDownDetails details) async {
    await AudioRecorder.hasPermissions;

    Directory dir = await Singleton.fileService.getPictureDirectory();
    String path = join(
      dir.path,
      'AUD_${DateTime.now().toIso8601String()}.mp4',
    );

    AudioRecorder.start(path: path, audioOutputFormat: AudioOutputFormat.AAC);
  }

  void _onInputContentChange(String value) {
    setState(() {
      _content = value;
      _mainButtonIcon = _content == '' ? Icons.mic : Icons.send;
    });
  }

  void _onMainButtonPressed() async {
    final isRecording = await AudioRecorder.isRecording;

    if (isRecording) {
      AudioRecorder.stop();
    }

    setState(() {
      _content = '';
      _mainButtonIcon = Icons.mic;
    });

    _controller.clear();
  }

  void _openShareActionSheet(BuildContext context) {
    showModalBottomSheet(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(20),
        ),
      ),
      context: context,
      builder: (BuildContext ctx) {
        return ShareMediaGrid();
      },
    );
  }
}
