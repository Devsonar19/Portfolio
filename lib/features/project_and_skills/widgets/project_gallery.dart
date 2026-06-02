import 'package:flutter/material.dart';
import 'project_card.dart';

class ProjectGallery extends StatelessWidget {
  const ProjectGallery({super.key});

  @override
  Widget build(BuildContext context) {
    // 💡 TO ADD A NEW PROJECT LATER:
    // Just add another dictionary object to this list!
    final projects = [
      {
        'title': 'LeetCode Stats',
        'description': 'A cross-platform application to track and visualize competitive programming metrics using interactive heatmaps and Native Android HomeScreen Widget.',
        'tags': ['Flutter', 'FastAPI', 'GraphQL', 'BLoC'],
        'image': 'assets/images/leetcode_dashboard.png',
        'link' : 'https://github.com/Devsonar19/LeetCode-Stats'
      },
      {
        'title': 'My Notes',
        'description': 'Developed a note-taking application using Flutter with a clean UI, and implemented full local CRUD operations using SQLite, later migrated to Firebase Firestore.',
        'tags': ['Flutter', 'Firestore', 'BLoC', 'PostgreSQL'],
        'image': 'assets/images/mynotes_dashboard.png',
        'link' : 'https://github.com/Devsonar19/My-Notes'
      },
      {
        'title': 'FastAPI REST',
        'description': 'Built a production-style REST API using FastAPI with modular architecture and also implemented JWT-based authentication, and OAuth2 flow.',
        'tags': ['Python', 'FastAPI', 'SQLAlchemy', 'JWT'],
        'image': 'assets/images/fastapi_dashboard.jpeg',
        'link' : 'https://github.com/Devsonar19/Learning-REST-API'
      },
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.primary, // Vibrant Red
            border: Border.all(color: Colors.black, width: 3),
          ),
          child: Text(
            "SELECTED_WORKS",
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
              fontWeight: FontWeight.w900,
              color: Colors.white,
            ),
          ),
        ),
        const SizedBox(height: 32),
        LayoutBuilder(
          builder: (context, constraints) {
            int crossAxisCount = constraints.maxWidth > 900 ? 3 : (constraints.maxWidth > 600 ? 2 : 1);

            return GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: crossAxisCount,
                crossAxisSpacing: 32, // Slightly increased for the harsh shadows
                mainAxisSpacing: 32,
                childAspectRatio: 0.80, // Adjusted slightly to fit the new borders
              ),
              itemCount: projects.length,
              itemBuilder: (context, index) {
                final project = projects[index];
                return ProjectCard(
                  title: project['title'] as String,
                  description: project['description'] as String,
                  tags: List<String>.from(project['tags'] as List),
                  imagePath: project['image'] as String,
                  link: project['link'] as String,
                );
              },
            );
          },
        ),
      ],
    );
  }
}