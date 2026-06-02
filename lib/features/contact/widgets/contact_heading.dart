import 'package:flutter/material.dart';

class ContactHeading extends StatelessWidget {
  final bool isMobile;
  const ContactHeading({super.key, required this.isMobile});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.primary, // Vibrant Red
            border: Border.all(color: Colors.black, width: 4),
          ),
          child: Text(
            "LET'S_HANDSHAKE",
            style: Theme.of(context).textTheme.displaySmall?.copyWith(
              fontWeight: FontWeight.w900,
              color: Colors.white,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        const SizedBox(height: 24),
        Container(
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: Colors.black, width: 3),
              boxShadow: const [
                BoxShadow(color: Colors.black, offset: Offset(6, 6), blurRadius: 0),
              ]
          ),
          child: Text(
            "Whether you have a question, a project idea, or just want to chat about Flutter, "
                "AI systems, or mind-bending films, my inbox is always open. I'll try my best to get back to you!",
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
              height: 1.6,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}