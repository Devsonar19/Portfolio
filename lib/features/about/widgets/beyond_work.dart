import 'package:flutter/material.dart';

class BeyondWork extends StatelessWidget {
  const BeyondWork({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Theme.of(context).colorScheme.surfaceContainer,
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(Icons.coffee, color: Theme.of(context).colorScheme.primary),
                const SizedBox(width: 12),
                Text(
                  "Beyond Work",
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Text(
              "When I am not writing code or setting up Linux environments, I prioritize a healthy lifestyle. Physical fitness and overall health are essential to keeping my mind sharp and fueling my growth mindset. I am also an avid reader and have a deep appreciation for mind-bending films that challenge conventional storytelling. Beyond technology and media, I care deeply about the environment and animal welfare. Ultimately, my focus is on helping others and building meaningful solutions that leave a positive impact on future generations.",
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                height: 1.6,
                color: Colors.white60,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
