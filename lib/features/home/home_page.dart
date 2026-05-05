import 'package:flutter/material.dart';
import 'package:my_portfolio/core/utils/responsive_layout.dart';
import 'package:my_portfolio/features/home/widgets/descriptive_section.dart';
import 'package:my_portfolio/features/home/widgets/my_photo.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

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
                    MyPhoto(size: 250),
                    const SizedBox(height: 40),
                    DescriptiveSection(isMobile: true),
                  ],
                ),
                desktop: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Expanded(
                      flex: 3,
                      child: DescriptiveSection(isMobile: false),
                    ),
                    const SizedBox(width: 60),
                    Expanded(
                      flex: 2,
                      child: Center(child: MyPhoto(size: 350)),
                    ),
                  ],
                ),
            ),
          )
      ),
    );
  }
}
