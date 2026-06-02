import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ProjectCard extends StatefulWidget {
  final String title;
  final String description;
  final List<String> tags;
  final String imagePath;
  final String link;

  const ProjectCard({
    super.key,
    required this.title,
    required this.description,
    required this.tags,
    required this.imagePath,
    required this.link,
  });

  @override
  State<ProjectCard> createState() => _ProjectCardState();
}

class _ProjectCardState extends State<ProjectCard> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => isHovered = true),
      onExit: (_) => setState(() => isHovered = false),
      child: GestureDetector(
        onTap: () async {
          final url = Uri.parse(widget.link);
          if (await canLaunchUrl(url)) {
            launchUrl(url);
          }
        },
        // The animation moves the box up and left while the shadow stays planted
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 150),
          transform: Matrix4.translationValues(
              isHovered ? -4.0 : 0.0,
              isHovered ? -4.0 : 0.0,
              0.0
          ),
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Colors.black, width: 3),
            boxShadow: [
              BoxShadow(
                color: Colors.black,
                // Shadow grows when hovered to simulate lifting off the page
                offset: isHovered ? const Offset(12, 12) : const Offset(6, 6),
                blurRadius: 0,
              )
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Image Section
              Expanded(
                flex: 4,
                child: Container(
                  decoration: const BoxDecoration(
                    border: Border(bottom: BorderSide(color: Colors.black, width: 3)),
                  ),
                  child: Image.asset(
                    widget.imagePath,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) => const Center(
                      child: Icon(Icons.broken_image, size: 50, color: Colors.black),
                    ),
                  ),
                ),
              ),
              // Content Section
              Expanded(
                flex: 5,
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Tags
                      Wrap(
                        spacing: 8,
                        runSpacing: 8,
                        children: widget.tags.map((tag) => Container(
                          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                          color: Colors.black,
                          child: Text(
                            tag,
                            style: Theme.of(context).textTheme.labelSmall?.copyWith(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        )).toList(),
                      ),
                      const SizedBox(height: 16),
                      // Title
                      Text(
                        widget.title.toUpperCase(),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          fontWeight: FontWeight.w900,
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(height: 12),
                      // Description
                      Expanded(
                        child: Text(
                          widget.description,
                          maxLines: 4,
                          overflow: TextOverflow.ellipsis,
                          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: Colors.black87,
                            fontWeight: FontWeight.w600,
                            height: 1.5,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}