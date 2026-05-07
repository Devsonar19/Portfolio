import 'package:flutter/material.dart';

class BuildingGenwin extends StatelessWidget {
  const BuildingGenwin({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.transparent,
      elevation: 0,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        side: BorderSide(
          color: Theme.of(context).colorScheme.primary,
          width: 2,
        ),
      ),

      child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Building a Community",
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),
              Text(
                "Building a community and people for the next Generation. Focusing on 4 fundamental pillars for young people, MINDSET, FINANCE, RELATIONSHIPS & TASTE. Building confidence, positive attitude and a sense of responsibility that'll fuel the growth of the community and the young generation. Let's grow together, for Betterment.",
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  height: 1.7,
                  color: Colors.white60,
                ),
              ),
              const SizedBox(height: 16),
              Text(
                "This Generation Will Win. Coming Soon!",
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  fontSize: 20,
                ),
              )
            ]
          )
      ),
    );
  }
}
