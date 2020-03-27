import 'package:flutter/material.dart';
import 'package:flutter_whats_clone/widgets/components/share_media/share_media_grid_item.dart';

class ShareMediaGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      heightFactor: 0.70,
      child: GridView.count(
        crossAxisCount: 3,
        children: <Widget>[
          ShareMediaGridItem(
            icon: Icons.description,
            text: 'Docs',
            color: Colors.purple,
          ),
          ShareMediaGridItem(
            icon: Icons.camera_alt,
            text: 'Camera',
            color: Colors.cyan,
          ),
          ShareMediaGridItem(
            icon: Icons.image,
            text: 'Gallery',
            color: Colors.red,
          ),
          ShareMediaGridItem(
            icon: Icons.music_note,
            text: 'Music',
            color: Colors.orange,
          ),
          ShareMediaGridItem(
            icon: Icons.location_on,
            text: 'Location',
            color: Colors.greenAccent,
          ),
          ShareMediaGridItem(
            icon: Icons.people_outline,
            text: 'Contact',
            color: Colors.blue,
          ),
        ],
      ),
    );
  }
}
