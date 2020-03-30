import 'package:flutter/material.dart';
import 'package:flutter_whats_clone/widgets/components/camera/camera_page_body.dart';
import 'package:flutter_whats_clone/widgets/connectors/camera_connector.dart';

class CameraPage extends StatelessWidget {
  static final routeName = '/camera';

  @override
  Widget build(BuildContext context) {
    return CameraConnector(
      builder: (context, state) {
        return CameraPageBody(
          cameraState: state,
        );
      },
    );
  }
}
