import 'package:flutter/material.dart';

class ShareMediaGridItem extends StatelessWidget {
  final String text;
  final IconData icon;
  final Color color;

  ShareMediaGridItem({
    @required this.icon,
    @required this.text,
    @required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          InkWell(
            child: Container(
              height: 72,
              width: 72,
              margin: EdgeInsets.all(8),
              padding: EdgeInsets.all(8),
              child: Icon(this.icon),
              decoration: BoxDecoration(
                color: color.withOpacity(0.3),
                border: Border.all(
                  color: color,
                ),
                borderRadius: BorderRadius.all(Radius.circular(64)),
              ),
            ),
          ),
          Text(this.text),
        ],
      ),
    );
  }
}
