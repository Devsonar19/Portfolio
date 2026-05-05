import 'package:flutter/material.dart';

void main(){
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

class _PortfolioScreenState extends State<PortfolioScreen>{
  int _currIndex = 0;

  final List<Widget> _pages = [
    const Center(child: Text("Home")),
    const Center(child: Text("About")),
    const Center(child: Text("Skill and Project")),
    const Center(child: Text("Contact")),
  ];

  void _onItemTapped(int index){
    setState(() {
      _currIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(70),
          // temporary appBar
          child: AppBar(
            title: const Text("Dev Sonar"),
            actions: [
              TextButton(
                  onPressed: () => _onItemTapped(0),
                  child: const Text("Home")
              ),
              TextButton(
                  onPressed: () => _onItemTapped(1),
                  child: const Text("About")
              ),
              TextButton(
                  onPressed: () => _onItemTapped(2),
                  child: const Text("Skill and Project")
              ),
              TextButton(
                  onPressed: () => _onItemTapped(3),
                  child: const Text("Contact")
              ),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: ElevatedButton(
                  onPressed: () {
                    //temporary resume button
                  },
                  child: const Text('Resume'),
                ),
              ),
            ],
          ),
      ),
      body: AnimatedSwitcher(
        duration: const Duration(milliseconds: 500),
        child: _pages[_currIndex],
      ),
    );
  }


}

