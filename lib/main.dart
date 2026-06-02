import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:my_portfolio/features/about/about_page.dart';
import 'package:my_portfolio/features/home/home_page.dart';
import 'features/contact/contact_page.dart';
import 'features/project_and_skills/project_and_skills_page.dart';

void main() {
  runApp(const MyPortfolioApp());
}

class MyPortfolioApp extends StatelessWidget {
  const MyPortfolioApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Dev Sonar",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.light,
        // A retro beige/off-white background
        scaffoldBackgroundColor: const Color(0xFFF4F0EA),
        // Monospace font for the retro-futurism coding aesthetic
        fontFamily: 'Courier',
        colorScheme: const ColorScheme.light(
          primary: Color(0xFFFF5252), // Vibrant Red/Pink
          secondary: Color(0xFF00E676), // Neon Green
          tertiary: Color(0xFFFFD600), // Cyber Yellow
          surface: Colors.white,
          onSurface: Colors.black,
        ),
      ),
      home: const PortfolioScreen(),
    );
  }
}

class PortfolioScreen extends StatefulWidget {
  const PortfolioScreen({super.key});

  @override
  State<PortfolioScreen> createState() => _PortfolioScreenState();
}

class _PortfolioScreenState extends State<PortfolioScreen> {
  int _currIndex = 0;

  List<Widget> get _pages => [
    HomePage(onNavigateToContact: () {
      _onItemTapped(3);
    },),
    const AboutPage(),
    const ProjectsSkillsPage(),
    const ContactPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _currIndex = index;
    });
    if (Scaffold.of(context).isEndDrawerOpen) {
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    final isDesktop = MediaQuery.of(context).size.width >= 800;

    return Scaffold(
      extendBodyBehindAppBar: false,

      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(90),
        child: Container(
          decoration: const BoxDecoration(
            color: Color(0xFFF4F0EA),
            // Thick bottom border
            border: Border(bottom: BorderSide(color: Colors.black, width: 4)),
          ),
          child: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            titleSpacing: 24,
            title: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.tertiary,
                border: Border.all(color: Colors.black, width: 3),
              ),
              child: const Text(
                "DEV.SONAR",
                style: TextStyle(
                  fontWeight: FontWeight.w900,
                  color: Colors.black,
                  fontSize: 24,
                  letterSpacing: 2,
                ),
              ),
            ),
            actions: isDesktop
                ? [
              _buildDesktopNavLinks(),
              const SizedBox(width: 24),
              _buildResumeButton(context),
              const SizedBox(width: 24),
            ]
                : [],
          ),
        ),
      ),

      endDrawer: isDesktop ? null : _buildMobileDrawer(context),

      body: AnimatedSwitcher(
        duration: const Duration(milliseconds: 200),
        transitionBuilder: (Widget child, Animation<double> animation) {
          return ScaleTransition(
            scale: animation,
            child: child,
          );
        },
        child: Container(
          key: ValueKey<int>(_currIndex),
          child: Center(child: _pages[_currIndex]),
        ),
      ),
    );
  }

  Widget _buildDesktopNavLinks() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        _NavBarItem(title: "HOME", isActive: _currIndex == 0, onTap: () => _onItemTapped(0)),
        _NavBarItem(title: "ABOUT", isActive: _currIndex == 1, onTap: () => _onItemTapped(1)),
        _NavBarItem(title: "WORKS", isActive: _currIndex == 2, onTap: () => _onItemTapped(2)),
        _NavBarItem(title: "PING_ME", isActive: _currIndex == 3, onTap: () => _onItemTapped(3)),
      ],
    );
  }

  Widget _buildResumeButton(BuildContext context) {
    return InkWell(
      onTap: () async {
        final pdfUrl = Uri.parse('https://drive.google.com/drive/folders/1s2IVWDwtwE3-gpZI2NR_avHMdv1uNA3Y');
        if (await canLaunchUrl(pdfUrl)) {
          await launchUrl(pdfUrl, mode: LaunchMode.externalApplication);
        }
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primary,
          border: Border.all(color: Colors.black, width: 3),
          // Harsh, unblurred shadow
          boxShadow: const [
            BoxShadow(color: Colors.black, offset: Offset(4, 4), blurRadius: 0),
          ],
        ),
        child: const Text(
          'RESUME.EXE',
          style: TextStyle(fontWeight: FontWeight.w900, color: Colors.white, fontSize: 16),
        ),
      ),
    );
  }

  Widget _buildMobileDrawer(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.tertiary,
      child: Container(
        decoration: const BoxDecoration(
          border: Border(left: BorderSide(color: Colors.black, width: 4)),
        ),
        child: ListView(
          padding: const EdgeInsets.all(24),
          children: [
            const SizedBox(height: 40),
            const Text(
              "SYSTEM.MENU",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.w900, color: Colors.black),
            ),
            const SizedBox(height: 24),
            _buildDrawerTile("HOME", 0),
            _buildDrawerTile("ABOUT", 1),
            _buildDrawerTile("WORKS", 2),
            _buildDrawerTile("PING_ME", 3),
            const SizedBox(height: 48),
            _buildResumeButton(context),
          ],
        ),
      ),
    );
  }

  Widget _buildDrawerTile(String title, int index) {
    final isActive = _currIndex == index;
    return ListTile(
      contentPadding: EdgeInsets.zero,
      title: Text(
        "> $title",
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w900,
          color: isActive ? Colors.white : Colors.black,
          backgroundColor: isActive ? Colors.black : Colors.transparent,
        ),
      ),
      onTap: () {
        Navigator.pop(context);
        _onItemTapped(index);
      },
    );
  }
}

class _NavBarItem extends StatefulWidget {
  final String title;
  final bool isActive;
  final VoidCallback onTap;

  const _NavBarItem({required this.title, required this.isActive, required this.onTap});

  @override
  State<_NavBarItem> createState() => _NavBarItemState();
}

class _NavBarItemState extends State<_NavBarItem> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        onEnter: (_) => setState(() => isHovered = true),
        onExit: (_) => setState(() => isHovered = false),
        child: GestureDetector(
          onTap: widget.onTap,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            decoration: BoxDecoration(
              color: widget.isActive ? Colors.black : (isHovered ? Colors.white : Colors.transparent),
              border: Border.all(
                color: widget.isActive || isHovered ? Colors.black : Colors.transparent,
                width: 3,
              ),
              boxShadow: isHovered && !widget.isActive
                  ? const [BoxShadow(color: Colors.black, offset: Offset(3, 3), blurRadius: 0)]
                  : null,
            ),
            child: Text(
              widget.title,
              style: TextStyle(
                color: widget.isActive ? Colors.white : Colors.black,
                fontWeight: FontWeight.w900,
                fontSize: 16,
              ),
            ),
          ),
        ),
      ),
    );
  }
}