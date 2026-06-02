import 'package:flutter/material.dart';

class SkillBox extends StatelessWidget {
  const SkillBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Brutalist Section Title
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.tertiary, // Cyber Yellow
            border: Border.all(color: Colors.black, width: 3),
          ),
          child: Text(
            "TECHNICAL_SKILLS",
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
              fontWeight: FontWeight.w900,
              color: Colors.black,
            ),
          ),
        ),
        const SizedBox(height: 16),
        Text(
          "> A categorized overview of my technical proficiencies, emphasizing cross-platform development and backend architectures.",
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
            color: Colors.black87,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 32),
        Wrap(
          spacing: 24,
          runSpacing: 24,
          children: [
            _buildSkillCategory(context, "FRONTEND & MOBILE", ["Flutter", "Dart", "Kotlin", "BLoC", "UI/UX"]),
            _buildSkillCategory(context, "BACKEND & CORE", ["Python", "FastAPI", "Django", "C++", "Java", "PostgreSQL", "Firestore", "DSA"]),
            _buildSkillCategory(context, "TOOLS & ENV", ["Linux", "Git/GitHub", "GraphQL", "REST APIs", "Android Studio"]),
            _buildSkillCategory(context, "FOCUS AREAS", ["Machine Learning", "Deep Learning", "System Design", "Docker"]),
          ],
        ),
      ],
    );
  }

  Widget _buildSkillCategory(BuildContext context, String title, List<String> skills) {
    return Container(
      width: 270,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.black, width: 3),
        boxShadow: const [
          BoxShadow(color: Colors.black, offset: Offset(6, 6), blurRadius: 0),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            color: Colors.black,
            child: Text(
              title,
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.w900,
                color: Colors.white,
              ),
            ),
          ),
          const SizedBox(height: 20),
          Wrap(
            spacing: 8,
            runSpacing: 12,
            children: skills.map((skill) => _buildSkillChip(context, skill)).toList(),
          ),
        ],
      ),
    );
  }

  Widget _buildSkillChip(BuildContext context, String label) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.secondary, // Neon Green Badges
          border: Border.all(color: Colors.black, width: 2),
          boxShadow: const [
            BoxShadow(color: Colors.black, offset: Offset(2, 2), blurRadius: 0),
          ]
      ),
      child: Text(
        label,
        style: Theme.of(context).textTheme.bodySmall?.copyWith(
          color: Colors.black,
          fontWeight: FontWeight.w900,
        ),
      ),
    );
  }
}