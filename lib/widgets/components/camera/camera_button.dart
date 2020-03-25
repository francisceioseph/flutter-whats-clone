import 'package:flutter/material.dart';

class CameraButton extends StatelessWidget {
  final IconData icon;
  final double size;
  final Color backgroundColor;
  final Color foregroundColor;
  final void Function() onPressed;
  final void Function() onLongPress;

  CameraButton({
    @required this.icon,
    this.size = 48,
    this.backgroundColor,
    this.foregroundColor,
    this.onPressed,
    this.onLongPress,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final defaultBackgroundColor = theme.buttonColor;
    final defaultForegroundColor = theme.iconTheme.color;

    return Container(
      child: RawMaterialButton(
        elevation: 2,
        shape: CircleBorder(),
        child: Icon(
          this.icon,
          color: foregroundColor ?? defaultForegroundColor,
        ),
        fillColor: backgroundColor ?? defaultBackgroundColor,
        constraints: BoxConstraints.tightFor(
          width: size,
          height: size,
        ),
        onPressed: this.onPressed,
        onLongPress: this.onLongPress,
      ),
    );
  }
}
