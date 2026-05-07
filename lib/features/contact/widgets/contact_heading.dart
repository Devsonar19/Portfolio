import 'package:flutter/material.dart';

class ContactHeading extends StatelessWidget {
  final bool isMobile;
  const ContactHeading({super.key, required this.isMobile});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "Let's Connect",
          style: Theme.of(context).textTheme.displaySmall?.copyWith(
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 16),
        Text(
          "Whether you have a question, a project idea, or just want to chat about Flutter, "
              "AI systems, or mind-bending films, my inbox is always open. I'll try my best to get back to you!",
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
            height: 1.6,
            color: Colors.grey[600],
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
