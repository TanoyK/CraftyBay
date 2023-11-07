


import 'package:flutter/material.dart';

class ReviewTitle extends StatelessWidget {
  const ReviewTitle({
    super.key, required this.title, this.icon,
  });
  final String title;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        if (icon != null)
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: CircleAvatar(
              radius: 15,
              backgroundColor: Colors.cyanAccent,
              child: Icon(
                icon,
                color: Colors.grey.shade400,
                size: 20,
              ),
            ),
          ),
        Text(
          title,
          style: TextStyle(
              fontSize: 16,
              color: Colors.black.withOpacity(0.7),
              fontWeight: FontWeight.w600),
        ),
      ],
    );
  }
}