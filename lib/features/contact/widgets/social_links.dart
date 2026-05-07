import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class SocialLinks extends StatelessWidget {
  const SocialLinks({super.key});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 24,
      runSpacing: 24,
      alignment: WrapAlignment.center,
      children: [
        _buildSocialButton(
          context,
          icon: Icons.email,
          label: "Email Me",
          url: "mailto:devsonar19@outlook.com",
        ),
        _buildSocialButton(
          context,
          icon: Icons.person,
          label: "LinkedIn",
          url: "https://www.linkedin.com/in/dev-sonar-656677281/",
        ),
        _buildSocialButton(
          context,
          icon: Icons.code,
          label: "GitHub",
          url: "https://github.com/Devsonar19",
        ),
        _buildSocialButton(
          context,
          icon: Icons.code_outlined,
          label: "LeetCode",
          url: "https://leetcode.com/u/Dev_Sonar19/",
        ),
      ],
    );
  }

  Widget _buildSocialButton(BuildContext context, {required IconData icon, required String label, required String url}) {
    return _HoverSocialButton(icon: icon, label: label, url: url);
  }
}

class _HoverSocialButton extends StatefulWidget {
  final IconData icon;
  final String label;
  final String url;

  const _HoverSocialButton({required this.icon, required this.label, required this.url});

  @override
  State<_HoverSocialButton> createState() => _HoverSocialButtonState();
}

class _HoverSocialButtonState extends State<_HoverSocialButton> {
  bool isHovered = false;

  Future<void> _launchURL() async {
    final uri = Uri.parse(widget.url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    }
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => isHovered = true),
      onExit: (_) => setState(() => isHovered = false),
      child: GestureDetector(
        onTap: _launchURL,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          width: 160,
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
          decoration: BoxDecoration(
            color: isHovered
                ? Theme.of(context).colorScheme.primary.withValues(alpha: 0.1)
                : Theme.of(context).colorScheme.surfaceContainerHighest.withValues(alpha: 0.3),
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              color: isHovered
                  ? Theme.of(context).colorScheme.primary
                  : Colors.grey.withValues(alpha: 0.2),
            ),
          ),
          child: Column(
            children: [
              Icon(
                widget.icon,
                size: 32,
                color: isHovered ? Colors.white : Colors.grey[700],
              ),
              const SizedBox(height: 12),
              Text(
                widget.label,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: isHovered ? Colors.white : Colors.grey[700],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
