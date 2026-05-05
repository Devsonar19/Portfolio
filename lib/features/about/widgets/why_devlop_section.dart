import 'package:flutter/material.dart';

class WhyDevlopSection extends StatelessWidget {
  const WhyDevlopSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Theme.of(context).colorScheme.surfaceContainer,
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),

      child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(Icons.code, color: Theme.of(context).colorScheme.primary),
                  const SizedBox(width: 12),
                  Text(
                    "Why Development?",
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Text(
                "Working with Flutter gives me the creative satisfaction of building smooth, beautiful user interfaces where I can see my code come to life instantly. But I’m equally drawn to backend development because that’s where the real engine lives—designing the architecture, managing databases, and making sure everything runs securely.",
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  height: 1.6,
                  color: Colors.grey[800],
                ),
              ),
            ]
          )
      ),
    );
  }
}
