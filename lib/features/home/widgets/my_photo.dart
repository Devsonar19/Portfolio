import 'package:flutter/material.dart';

class MyPhoto extends StatelessWidget {
  final double size;
  const MyPhoto({super.key, this.size = 300});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.tertiary,
        border: Border.all(color: Colors.black, width: 4),
        boxShadow: const [
          BoxShadow(
            color: Colors.black,
            offset: Offset(8, 8),
            blurRadius: 0,
            spreadRadius: 0,
          )
        ],
      ),
      child: Image.asset(
        'assets/images/my_photo.jpeg',
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