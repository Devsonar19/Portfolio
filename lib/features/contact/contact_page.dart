import 'package:flutter/material.dart';
import 'package:my_portfolio/core/utils/responsive_layout.dart';
import 'package:my_portfolio/features/contact/widgets/contact_heading.dart';
import 'package:my_portfolio/features/contact/widgets/location_box.dart';
import 'package:my_portfolio/features/contact/widgets/social_links.dart';

class ContactPage extends StatelessWidget {
  const ContactPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 1200),
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 48.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ContactHeading(isMobile: ResponsiveLayout.isMobile(context)),
              const SizedBox(height: 60),
              const SocialLinks(),
              const SizedBox(height: 60),
              const LocationBox(),
              const SizedBox(height: 48),
            ],
          ),
        ),
      ),
    );
  }
}