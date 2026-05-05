import 'package:flutter/material.dart';

class MyPhoto extends StatelessWidget {
  final double size;
  const MyPhoto({super.key, this.size=300});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,

      decoration: BoxDecoration(
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: Theme.of(context).colorScheme.primary.withOpacity(0.3),
            blurRadius: 30,
            spreadRadius: 10,
          )
        ]
      ),

      child: ClipOval(
        child: Image.asset(
          'assets/images/my_photo.jpeg',
          fit: BoxFit.cover,

          errorBuilder: (context, error, stackTrace){
            return Container(
              color : Theme.of(context).colorScheme.surfaceContainerHighest,
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
