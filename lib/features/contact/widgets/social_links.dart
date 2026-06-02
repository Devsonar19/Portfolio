import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; // Required for Clipboard
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
          label: "EMAIL_ME",
          title: "devsonar19@outlook.com",
          url: "copy", // Special trigger for copying
          color: Theme.of(context).colorScheme.tertiary,
        ),
        _buildSocialButton(
          context,
          icon: Icons.person,
          label: "LINKEDIN",
          title: "dev-sonar-656677281",
          url: "https://www.linkedin.com/in/dev-sonar-656677281/",
          color: Theme.of(context).colorScheme.secondary,
        ),
        _buildSocialButton(
          context,
          icon: Icons.developer_mode,
          label: "GITHUB",
          title: "Devsonar19",
          url: "https://github.com/Devsonar19",
          color: Colors.white,
        ),
        _buildSocialButton(
          context,
          icon: Icons.code_outlined,
          label: "LEETCODE",
          title: "Dev_Sonar19",
          url: "https://leetcode.com/u/Dev_Sonar19/",
          color: Theme.of(context).colorScheme.primary,
        ),
      ],
    );
  }

  Widget _buildSocialButton(
      BuildContext context, {
        required IconData icon,
        required String label,
        required String url,
        required String title,
        required Color color,
      }) {
    return _HoverSocialButton(
      icon: icon,
      label: label,
      url: url,
      title: title,
      baseColor: color,
    );
  }
}

class _HoverSocialButton extends StatefulWidget {
  final IconData icon;
  final String label;
  final String url;
  final String title;
  final Color baseColor;

  const _HoverSocialButton({
    required this.icon,
    required this.label,
    required this.url,
    required this.title,
    required this.baseColor,
  });

  @override
  State<_HoverSocialButton> createState() => _HoverSocialButtonState();
}

class _HoverSocialButtonState extends State<_HoverSocialButton> {
  bool isHovered = false;

  Future<void> _handleAction() async {
    if (widget.url == "copy") {
      await Clipboard.setData(ClipboardData(text: widget.title));
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: const Text(
              "EMAIL COPIED TO CLIPBOARD",
              style: TextStyle(fontWeight: FontWeight.w900, color: Colors.white, fontFamily: 'Courier'),
            ),
            backgroundColor: Colors.black,
            duration: const Duration(seconds: 2),
            behavior: SnackBarBehavior.floating,
            shape: Border.all(color: Colors.white, width: 2), // Brutalist Snackbar
          ),
        );
      }
    } else {
      final uri = Uri.parse(widget.url);
      if (await canLaunchUrl(uri)) {
        await launchUrl(uri, mode: LaunchMode.externalApplication);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => isHovered = true),
      onExit: (_) => setState(() => isHovered = false),
      child: GestureDetector(
        onTap: _handleAction,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 150),
          width: 240,
          transform: Matrix4.translationValues(
            isHovered ? -4.0 : 0.0,
            isHovered ? -4.0 : 0.0,
            0.0,
          ),
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
          decoration: BoxDecoration(
            color: widget.baseColor,
            border: Border.all(color: Colors.black, width: 3),
            boxShadow: [
              BoxShadow(
                color: Colors.black,
                offset: isHovered ? const Offset(8, 8) : const Offset(4, 4),
                blurRadius: 0,
              )
            ],
          ),
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                color: Colors.black,
                child: Icon(
                  widget.icon,
                  size: 32,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 12),
              Text(
                widget.label,
                style: TextStyle(
                  fontWeight: FontWeight.w900,
                  color: widget.baseColor == Colors.black ? Colors.white : Colors.black,
                  fontSize: 18,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                widget.title,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: widget.baseColor == Colors.black ? Colors.white70 : Colors.black87,
                  fontSize: 14,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}