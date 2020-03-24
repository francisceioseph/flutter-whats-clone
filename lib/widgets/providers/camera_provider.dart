import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

class CameraProvider extends StatefulWidget {
  final Widget Function(BuildContext, List<CameraDescription>) builder;

  CameraProvider({
    @required this.builder,
  });

  @override
  _CameraProviderState createState() {
    WidgetsFlutterBinding.ensureInitialized();

    return _CameraProviderState();
  }
}

class _CameraProviderState extends State<CameraProvider> {
  Future<List<CameraDescription>> _availableCameras = availableCameras();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: FutureBuilder(
        future: _availableCameras,
        builder: (
          BuildContext context,
          AsyncSnapshot<List<CameraDescription>> snap,
        ) {
          if (snap.hasData) {
            return widget.builder(context, snap.data);
          }

          return Text('Loading...');
        },
      ),
    );
  }
}
