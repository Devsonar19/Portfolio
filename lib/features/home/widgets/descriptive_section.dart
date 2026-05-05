import 'package:flutter/material.dart';

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
            color: Theme.of(context).colorScheme.primary,
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
            color: Colors.grey[800],
          ),
          textAlign: textAlign,
        ),
        const SizedBox(height: 32),

        ElevatedButton.icon(
            onPressed: (){

            },
            icon: const Icon(Icons.rocket_launch),
            label: const Text("Let's Build"),
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
            textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }
}
