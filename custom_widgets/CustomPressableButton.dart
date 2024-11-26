import 'package:flutter/material.dart';

class CustomPressableButton extends StatelessWidget {
  final String title;
  final VoidCallback onPress;
  final bool showIcon;

  CustomPressableButton({
    required this.title,
    required this.onPress,
    this.showIcon = false,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPress,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (showIcon) Icon(Icons.check),
          Text(title),
        ],
      ),
    );
  }
}
