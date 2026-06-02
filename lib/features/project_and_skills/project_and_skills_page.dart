import 'package:flutter/material.dart';
import 'widgets/project_gallery.dart';
import 'widgets/skill_box.dart';

class ProjectsSkillsPage extends StatelessWidget {
  const ProjectsSkillsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 1200),
        child: const SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 24.0, vertical: 48.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SkillBox(),
              SizedBox(height: 80),
              ProjectGallery(),
            ],
          ),
        ),
      ),
    );
  }
}