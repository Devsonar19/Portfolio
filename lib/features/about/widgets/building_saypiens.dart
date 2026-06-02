import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class BuildingSaypiens extends StatelessWidget {
  const BuildingSaypiens({super.key});

  Future<void> _launchSaypiens() async {
    final uri = Uri.parse('https://saypiens.life');
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24.0),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.tertiary, // Cyber Yellow backdrop
        border: Border.all(color: Colors.black, width: 4),
        boxShadow: const [
          BoxShadow(color: Colors.black, offset: Offset(8, 8), blurRadius: 0)
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Brutalist Title Block
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            color: Colors.black,
            child: Text(
              "BUILDING_SAYPIENS",
              style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                fontWeight: FontWeight.w900,
                color: Colors.white,
              ),
            ),
          ),
          const SizedBox(height: 16),

          // Subtitle
          Text(
            "> COMMUNITY FOR GENZ",
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.w900,
              color: Colors.black,
              letterSpacing: 1.5,
            ),
          ),
          const SizedBox(height: 24),

          // Main Content
          Text(
            "A team that believes in offline connection, rather than online presence. We noticed something: real friendships don't happen in feeds. They happen when you show up. When you listen without distraction. When you're actually present with the people in front of you. So we built this community around that simple idea. No performance. No algorithm. Just humans choosing each other, consistently.",
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
              height: 1.6,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 24),

          // The Quote Box
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: Colors.black, width: 2),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Icon(Icons.format_quote, color: Colors.black, size: 32),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    "We were bestowed upon the past, but we are accountable for the future.",
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.w900,
                      color: Colors.black,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 32),

          // Action Button
          InkWell(
            onTap: _launchSaypiens,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primary, // Vibrant Red
                border: Border.all(color: Colors.black, width: 3),
                boxShadow: const [
                  BoxShadow(color: Colors.black, offset: Offset(4, 4), blurRadius: 0),
                ],
              ),
              child: const Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "JOIN_US",
                    style: TextStyle(fontWeight: FontWeight.w900, color: Colors.white, fontSize: 16),
                  ),
                  SizedBox(width: 12),
                  Icon(Icons.arrow_outward, color: Colors.white, size: 20),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}