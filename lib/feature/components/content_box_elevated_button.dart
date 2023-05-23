import 'package:flutter/material.dart';

class ContentBoxElevatedButton extends StatelessWidget {
  final String title;
  final VoidCallback onTap;

  const ContentBoxElevatedButton({
    super.key,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: ElevatedButton(
        onPressed: onTap,
        child: Text(title),
      ),
    );
  }
}
