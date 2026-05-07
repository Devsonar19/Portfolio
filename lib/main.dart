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
        fontFamily: 'Arial',
        brightness: Brightness.dark,
        scaffoldBackgroundColor: const Color(0xFF121212),
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

  final List<Widget> _pages = [
    const HomePage(),
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
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(80),
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.black.withOpacity(0.8),
                Colors.transparent,
              ],
            ),
          ),
          child: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            titleSpacing: 24,
            title: Text(
              "Portfolio",
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 22, letterSpacing: 1.2),
            ),

            actions: isDesktop
                ? [
              _buildDesktopNavLinks(),
              const SizedBox(width: 24),
              _buildResumeButton(),
              const SizedBox(width: 24),
            ]
                : [],
          ),
        ),
      ),

      endDrawer: isDesktop ? null : _buildMobileDrawer(),

      body: AnimatedSwitcher(
        duration: const Duration(milliseconds: 500),
        transitionBuilder: (Widget child, Animation<double> animation) {
          return FadeTransition(
            opacity: animation,
            child: SlideTransition(
              position: Tween<Offset>(
                begin: const Offset(0.0, 0.05),
                end: Offset.zero,
              ).animate(animation),
              child: child,
            ),
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
        _NavBarItem(title: "Home", isActive: _currIndex == 0, onTap: () => _onItemTapped(0)),
        _NavBarItem(title: "About", isActive: _currIndex == 1, onTap: () => _onItemTapped(1)),
        _NavBarItem(title: "Skills & Projects", isActive: _currIndex == 2, onTap: () => _onItemTapped(2)),
        _NavBarItem(title: "Contact", isActive: _currIndex == 3, onTap: () => _onItemTapped(3)),
      ],
    );
  }

  Widget _buildResumeButton() {
    return ElevatedButton(
      onPressed: () {
        final pdfUrl = Uri.parse('https://drive.google.com/drive/folders/1s2IVWDwtwE3-gpZI2NR_avHMdv1uNA3Y');
        launchUrl(pdfUrl);
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
      child: const Text('Resume', style: TextStyle(fontWeight: FontWeight.bold)),
    );
  }

  Widget _buildMobileDrawer() {
    return Drawer(
      backgroundColor: const Color(0xFF1E1E1E),
      child: ListView(
        padding: const EdgeInsets.all(24),
        children: [
          const SizedBox(height: 40),
          const Text("Menu", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white)),
          const SizedBox(height: 24),
          ListTile(
              title: const Text("Home"),
              onTap: () {
                Navigator.pop(context);
                _onItemTapped(0);
              },
              selected: _currIndex == 0
          ),
          ListTile(
              title: const Text("About"),
              onTap: () {
                Navigator.pop(context);
                _onItemTapped(1);
              },
              selected: _currIndex == 1
          ),
          ListTile(
              title: const Text("Skills & Projects"),
              onTap: (){
                Navigator.pop(context);
                _onItemTapped(2);
              },
              selected: _currIndex == 2
          ),
          ListTile(
              title: const Text("Contact"),
              onTap: () {
                Navigator.pop(context);
                _onItemTapped(3);
              },
              selected: _currIndex == 3
          ),
          const SizedBox(height: 24),
          _buildResumeButton(),
        ],
      ),
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
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        onEnter: (_) => setState(() => isHovered = true),
        onExit: (_) => setState(() => isHovered = false),
        child: GestureDetector(
          onTap: widget.onTap,
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: widget.isActive || isHovered ? Colors.blueAccent : Colors.transparent,
                  width: 2.0,
                ),
              ),
            ),
            child: Text(
              widget.title,
              style: TextStyle(
                color: widget.isActive || isHovered ? Colors.white : Colors.grey[400],
                fontWeight: widget.isActive ? FontWeight.bold : FontWeight.normal,
                fontSize: 16,
              ),
            ),
          ),
        ),
      ),
    );
  }
}