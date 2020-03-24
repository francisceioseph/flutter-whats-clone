import 'package:flutter/material.dart';
import 'package:flutter_whats_clone/widgets/components/camera/camera_page_body.dart';
import 'package:flutter_whats_clone/widgets/providers/camera_provider.dart';

class CameraPage extends StatelessWidget {
  static final routeName = '/camera';

  @override
  Widget build(BuildContext context) {
    return CameraProvider(
      builder: (context, cameras) {
        return CameraPageBody(cameras: cameras);
      },
    );
  }
}
