import 'package:flutter/material.dart';
import 'package:my_portfolio/core/utils/responsive_layout.dart';
// Adjust these import paths based on your actual folder structure
import 'widgets/descriptive_section.dart';
import 'widgets/my_photo.dart';

class HomePage extends StatelessWidget {
  final VoidCallback onNavigateToContact;

  const HomePage({
    super.key,
    required this.onNavigateToContact,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 1200),
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 48),
          child: ResponsiveLayout(
            mobile: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const MyPhoto(size: 250),
                const SizedBox(height: 40),
                DescriptiveSection(
                  isMobile: true,
                  onNavigateToContact: onNavigateToContact,
                ),
              ],
            ),
            desktop: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  flex: 3,
                  child: DescriptiveSection(
                    isMobile: false,
                    onNavigateToContact: onNavigateToContact,
                  ),
                ),
                const SizedBox(width: 60),
                const Expanded(
                  flex: 2,
                  child: Center(child: MyPhoto(size: 350)),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}