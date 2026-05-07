import 'package:flutter/material.dart';

class AboutPhoto extends StatelessWidget {
  const AboutPhoto({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      height: 300,

      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 7,
          )
        ]
      ),

      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Image.asset(
          'assets/images/my_photo2.jpeg',
          fit: BoxFit.cover,
          errorBuilder: (context, error, stackTrace) {
            return Container(
              color: Theme.of(context).colorScheme.surfaceContainerHighest,
              child: const Icon(
                Icons.person,
                size: 100,
                color: Colors.grey,
              ),
            );
          },
        )
      ),
    );
  }
}
