import 'package:flutter/material.dart';

class SkillBox extends StatelessWidget {
  const SkillBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Skills",
          style: Theme.of(context).textTheme.headlineMedium?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 12),
        Text(
          "A categorized overview of my technical proficiencies, emphasizing cross-platform development and backend architectures.",
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: Colors.grey[600]),
        ),
        const SizedBox(height: 32),
        Wrap(
          spacing: 24,
          runSpacing: 24,
          children: [
            _buildSkillCategory(context, "Frontend & Mobile", ["Flutter", "Dart", "Kotlin" ,"BLoC State Management", "UI/UX"]),
            _buildSkillCategory(context, "Backend & Core", ["Python", "FastAPI", "Django" ,"C++", "Java", "PostgreSQL", "Firebase Firestore" ,"Data Structures", "Algorithms"]),
            _buildSkillCategory(context, "Tools & Environments", ["Linux", "Git/GitHub", "GraphQL", "REST APIs", "Android Studio"]),
            _buildSkillCategory(context, "Focus Areas", ["Machine Learning", "Deep Learning", "System Design", "Docker"]),
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
        color: Theme.of(context).colorScheme.surfaceContainerHighest.withOpacity(0.3),
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: Colors.grey.withOpacity(0.2)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),
          Wrap(
            spacing: 8,
            runSpacing: 8,
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
        color: Theme.of(context).colorScheme.surfaceContainerHighest.withOpacity(0.3),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.grey.withOpacity(0.3)),
      ),
      child: Text(
        label,
        style: Theme.of(context).textTheme.bodySmall?.copyWith(color: Colors.white70),
      ),
    );
  }
}