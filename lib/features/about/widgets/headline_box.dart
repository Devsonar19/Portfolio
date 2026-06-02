import 'package:flutter/material.dart';

class HeadlineBox extends StatelessWidget {
  final bool isMobile;
  const HeadlineBox({super.key, required this.isMobile});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: isMobile ? CrossAxisAlignment.center : CrossAxisAlignment.start,
      children: [
        // Title with a background highlight
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.primary, // Vibrant Red
            border: Border.all(color: Colors.black, width: 3),
          ),
          child: Text(
            "MORE_ABOUT_ME",
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
              fontWeight: FontWeight.w900,
              color: Colors.white,
            ),
            textAlign: isMobile ? TextAlign.center : TextAlign.left,
          ),
        ),
        const SizedBox(height: 24),
        Text(
          "I am a 21-year-old Computer Science student."
              "My academic journey is currently anchored in my 4th semester, where I am diving deep into Machine Learning. "
              "I believe that the best way to understand complex concepts is to build them from the ground up. "
              "Also I'm a bit of a nerd; anything that involves brain-teasing logic or intense emotions catches my attention, I live for meaning in Life.",
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
            height: 1.7,
            color: Colors.black, // Dark text for the beige background
            fontWeight: FontWeight.bold,
          ),
          textAlign: isMobile ? TextAlign.center : TextAlign.left,
        ),
      ],
    );
  }
}