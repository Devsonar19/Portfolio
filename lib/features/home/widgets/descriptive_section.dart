import 'package:flutter/material.dart';

class DescriptiveSection extends StatelessWidget {
  final bool isMobile;
  final VoidCallback onNavigateToContact;

  const DescriptiveSection({
    super.key,
    required this.isMobile,
    required this.onNavigateToContact,
  });

  @override
  Widget build(BuildContext context) {
    final textAlign = isMobile ? TextAlign.center : TextAlign.left;
    final crossAlign = isMobile ? CrossAxisAlignment.center : CrossAxisAlignment.start;

    return Column(
      crossAxisAlignment: crossAlign,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.secondary, // Neon Green
            border: Border.all(color: Colors.black, width: 3),
          ),
          child: Text(
            "HELLO, I'M DEV SONAR",
            style: Theme.of(context).textTheme.displayMedium?.copyWith(
              fontWeight: FontWeight.w900,
              color: Colors.black,
              fontSize: isMobile ? 32 : null,
            ),
            textAlign: textAlign,
          ),
        ),
        const SizedBox(height: 24),

        Text(
          "COMPUTER SCIENCE STUDENT\nBUILDING SOMETHING MEANINGFUL",
          style: Theme.of(context).textTheme.headlineSmall?.copyWith(
            color: Colors.black,
            fontWeight: FontWeight.w900,
            backgroundColor: Theme.of(context).colorScheme.tertiary, // Yellow highlight
            height: 1.4,
          ),
          textAlign: textAlign,
        ),
        const SizedBox(height: 24),

        Container(
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: Colors.black, width: 3),
              boxShadow: const [
                BoxShadow(color: Colors.black, offset: Offset(4, 4), blurRadius: 0)
              ]
          ),
          child: Text(
            "I am currently in my 4th semester with a strong focus on Artificial Intelligence and Machine Learning. "
                "I am deeply interested in software engineering, specifically engineering systems from the ground up "
                "using Flutter, Python, and FastAPI.",
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
              height: 1.6,
              color: Colors.black,
            ),
            textAlign: textAlign,
          ),
        ),
        const SizedBox(height: 32),

        InkWell(
          onTap: onNavigateToContact,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primary, // Vibrant Red
              border: Border.all(color: Colors.black, width: 3),
              boxShadow: const [
                BoxShadow(color: Colors.black, offset: Offset(4, 4), blurRadius: 0),
              ],
            ),
            child: const Text(
              "INITIATE_CONTACT",
              style: TextStyle(fontWeight: FontWeight.w900, color: Colors.white, fontSize: 18),
            ),
          ),
        ),
      ],
    );
  }
}