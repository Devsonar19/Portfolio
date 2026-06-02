import 'package:flutter/material.dart';

class WhyDevlopSection extends StatelessWidget {
  const WhyDevlopSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24.0),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.black, width: 3),
        boxShadow: const [
          BoxShadow(color: Colors.black, offset: Offset(6, 6), blurRadius: 0)
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                color: Colors.black,
                child: const Icon(Icons.code, color: Colors.white),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Text(
                  "WHY_DEVELOPMENT?",
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.w900,
                    color: Colors.black,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Text(
            "Working with Flutter gives me the creative satisfaction of building smooth, beautiful user interfaces where I can see my code come to life instantly. But I’m equally drawn to backend development because that’s where the real engine lives, designing the architecture, managing databases, and making sure everything runs securely.",
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              height: 1.6,
              color: Colors.black87,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}