import 'package:flutter/material.dart';
import 'package:my_portfolio/features/about/widgets/about_photo.dart';
import 'package:my_portfolio/features/about/widgets/beyond_work.dart';
import 'package:my_portfolio/features/about/widgets/building_saypiens.dart';
import 'package:my_portfolio/features/about/widgets/headline_box.dart';
import 'package:my_portfolio/features/about/widgets/why_devlop_section.dart';
import '../../core/utils/responsive_layout.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 1200),
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 48),
          child: ResponsiveLayout(
            mobile: const Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                AboutPhoto(),
                SizedBox(height: 40),
                HeadlineBox(isMobile: true),
                SizedBox(height: 48),
                WhyDevlopSection(),
                SizedBox(height: 32),
                BeyondWork(),
                SizedBox(height: 48),
                BuildingSaypiens(),
              ],
            ),
            desktop: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AboutPhoto(),
                    SizedBox(width: 48),
                    Expanded(child: HeadlineBox(isMobile: false)),
                  ],
                ),
                const SizedBox(height: 60),
                const Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(child: WhyDevlopSection()),
                    SizedBox(width: 32),
                    Expanded(child: BeyondWork()),
                  ],
                ),
                const SizedBox(height: 48),
                const BuildingSaypiens(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}