import 'package:flutter/material.dart';

class CountryInputBox extends StatelessWidget {
  final String placeholder;
  final TextInputType keyboardType;
  final ValueChanged<String> onChanged;

  CountryInputBox({
    required this.placeholder,
    required this.keyboardType,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        labelText: placeholder,
        border: OutlineInputBorder(),
      ),
      keyboardType: keyboardType,
      onChanged: onChanged,
    );
  }
}
