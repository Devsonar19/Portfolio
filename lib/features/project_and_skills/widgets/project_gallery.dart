import 'package:flutter/material.dart';
import 'project_card.dart';

class ProjectGallery extends StatelessWidget {
  const ProjectGallery({super.key});

  @override
  Widget build(BuildContext context) {
    final projects = [
      {
        'title': 'LeetCode Stats Dashboard',
        'description': 'A cross-platform application to track and visualize competitive programming metrics using interactive heatmaps and Native Android HomeScreen Widget.',
        'tags': ['Flutter', 'FastAPI', 'GraphQL', 'BLoC', 'Kotlin'],
        'image': 'assets/images/leetcode_dashboard.png',
        'link' : 'https://github.com/Devsonar19/LeetCode-Stats'
      },
      {
        'title': 'My Notes',
        'description': 'Developed a note-taking application using Flutter with a clean UI, and implemented full local CRUD operations using SQLite, later migrated to Firebase Firestore for real-time cloud sync.',
        'tags': ['Flutter', 'Firebase Firestore', 'BLoC', 'PostgreSQL', 'Firebase Authentication'],
        'image': 'assets/images/mynotes_dashboard.png',
        'link' : 'https://github.com/Devsonar19/My-Notes'
      },
      {
        'title': 'FastAPI REST Project',
        'description': 'Built a production-style REST API using FastAPI with modular and scalable architecture and also implemented JWT-based authentication, OAuth2 flow, and secure token validation mechanisms.',
        'tags': ['Python', 'FastAPI', 'SQLAlchemy', 'JWT', 'OAuth2', 'ORM', 'CI/CD', 'PostgreSQL'],
        'image': 'assets/images/fastapi_dashboard.jpeg',
        'link' : 'https://github.com/Devsonar19/Learning-REST-API'
      },
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Selected Works",
          style: Theme.of(context).textTheme.headlineMedium?.copyWith(
            fontWeight: FontWeight.bold,
            color: Colors.blueAccent,
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
                crossAxisSpacing: 24,
                mainAxisSpacing: 24,
                childAspectRatio: 0.85,
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