import 'package:flutter/material.dart';

class HeadlineBox extends StatelessWidget {
  final bool isMobile;
  const HeadlineBox({super.key, required this.isMobile});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: isMobile ? CrossAxisAlignment.center : CrossAxisAlignment.start,
      children: [
        Text(
          "More About Me",
          style: Theme.of(context).textTheme.headlineMedium?.copyWith(
            fontWeight: FontWeight.bold,
          ),
          textAlign: isMobile ? TextAlign.center : TextAlign.left,
        ),
        Text(
          "I am a 21-year-old Computer Science student based in Surat, India. "
              "My academic journey is currently anchored in my 4th semester, where I am diving deep into Artificial Intelligence and Machine Learning. "
              "I believe that the best way to understand complex concepts is to build them from the ground up.",
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
            height: 1.7,
            color: Colors.white70,
          ),
          textAlign: isMobile ? TextAlign.center : TextAlign.left,
        ),
      ],
    );
  }
}
