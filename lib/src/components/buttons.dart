import 'package:flutter/material.dart';

class MainButton extends StatelessWidget {
  final Function() onTap;
  final String text;
  final bool? enabled;

  const MainButton({
    super.key,
    required this.onTap,
    required this.text,
    this.enabled,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: enabled != null && enabled! ? onTap : null,
      child: Container(
        height: 60,
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: enabled != null && enabled!
              ? Theme.of(context).colorScheme.primary
              : Colors.grey.shade700,
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              color: Theme.of(context).colorScheme.onPrimary,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}

class DiagButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const DiagButton({
    super.key,
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      color: Theme.of(context).colorScheme.primary,
      child: Text(text),
    );
  }
}
