import 'package:flutter/material.dart';

class BeyondWork extends StatelessWidget {
  const BeyondWork({super.key});

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
                color: Theme.of(context).colorScheme.primary, // Red accent
                child: const Icon(Icons.coffee, color: Colors.white),
              ),
              const SizedBox(width: 16),
              Text(
                "BEYOND_WORK",
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.w900,
                  color: Colors.black,
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Text(
            "When I am not writing code or setting up Linux environments, I prioritize a healthy lifestyle. Physical fitness and overall health are essential to keeping my mind sharp and fueling my growth mindset. I am also an avid reader and have a deep appreciation for mind-bending films that challenge conventional storytelling. Ultimately, my focus is on helping others and building meaningful solutions that leave a positive impact.",
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