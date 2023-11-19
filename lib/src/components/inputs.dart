import 'package:flutter/material.dart';

class TextInputField extends StatefulWidget {
  final String hintText;
  final Function(String)? onChanged;

  const TextInputField({
    super.key,
    required this.hintText,
    this.onChanged,
  });

  @override
  TextInputFieldState createState() => TextInputFieldState();
}

class TextInputFieldState extends State<TextInputField> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: widget.onChanged,
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Theme.of(context).colorScheme.primary),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide:
              BorderSide(color: Theme.of(context).colorScheme.secondary),
        ),
        fillColor: Colors.grey[100],
        hintText: widget.hintText,
        hintStyle: TextStyle(color: Theme.of(context).colorScheme.secondary),
      ),
    );
  }
}
