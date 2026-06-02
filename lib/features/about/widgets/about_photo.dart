import 'package:flutter/material.dart';

class AboutPhoto extends StatelessWidget {
  const AboutPhoto({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      height: 300,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.secondary, // Neon Green backdrop
        border: Border.all(color: Colors.black, width: 4),
        boxShadow: const [
          BoxShadow(
            color: Colors.black,
            offset: Offset(8, 8), // Brutalist solid shadow
            blurRadius: 0,
            spreadRadius: 0,
          )
        ],
      ),
      child: Image.asset(
        'assets/images/my_photo2.jpeg',
        fit: BoxFit.cover,
        errorBuilder: (context, error, stackTrace) {
          return Container(
            color: Colors.white,
            child: const Icon(
              Icons.person,
              size: 100,
              color: Colors.black,
            ),
          );
        },
      ),
    );
  }
}