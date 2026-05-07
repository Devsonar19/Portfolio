import 'package:flutter/material.dart';
import 'package:my_portfolio/features/contact/contact_page.dart';

class DescriptiveSection extends StatelessWidget {
  final bool isMobile;
  const DescriptiveSection({super.key, required this.isMobile});

  @override
  Widget build(BuildContext context) {
    final textAlign = isMobile ? TextAlign.center : TextAlign.left;
    final crossAlign = isMobile ? CrossAxisAlignment.center : CrossAxisAlignment.start;

    return Column(
      crossAxisAlignment: crossAlign,
      children: [
        Text(
            "Hello, I'm Dev Sonar",
          style: Theme.of(context).textTheme.displayMedium?.copyWith(
            fontWeight: FontWeight.bold,
          ),
          textAlign: textAlign,
        ),
        const SizedBox(height: 16),
        Text(
          "Computer Science Student | Building Scalable Systems",
          style: Theme.of(context).textTheme.headlineSmall?.copyWith(
            color: Colors.white70,
            fontWeight: FontWeight.w600,
          ),
          textAlign: textAlign,
        ),
        const SizedBox(height: 24),
        Text(
          "I am currently in my 4th semester with a strong focus on Artificial Intelligence and Machine Learning. "
              "I am deeply interested in software engineering, specifically engineering systems from the ground up "
              "using Flutter, Python, and FastAPI.",
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
            height: 1.6,
            color: Colors.white60,
          ),
          textAlign: textAlign,
        ),
      ],
    );
  }
}
