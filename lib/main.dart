
import 'package:dedikodu/presentation/controllers/stream_controller.dart';
import 'package:dedikodu/presentation/pages/events_page.dart';
import 'package:dedikodu/presentation/pages/profile_page.dart';
import 'package:dedikodu/presentation/pages/stream_page.dart';
import 'package:dedikodu/presentation/pages/venues_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => StreamController(),
      child: MaterialApp(
        title: 'Dedikodu',
        theme: ThemeData(
          fontFamily: 'Plus Jakarta Sans',
          colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF19E65E)),
          useMaterial3: true,
        ),
        debugShowCheckedModeBanner: false,
        home: const MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;

  static const List<Widget> _widgetOptions = <Widget>[
    StreamPage(),
    EventsPage(),
    VenuesPage(),
    ProfilePage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  Widget _buildNavItem(IconData icon, String label, int index) {
    final isSelected = _selectedIndex == index;
    final color = isSelected ? const Color(0xFF19E65E) : const Color(0xFF63886F);

    return GestureDetector(
      onTap: () => _onItemTapped(index),
      behavior: HitTestBehavior.opaque,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 2),
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xFF19E65E).withOpacity(0.1) : Colors.transparent,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, color: color, size: 26),
            const SizedBox(height: 4),
            Text(
              label,
              style: TextStyle(
                fontSize: 10,
                fontWeight: FontWeight.bold,
                color: color,
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: Container(
        margin: const EdgeInsets.all(20),
        padding: const EdgeInsets.symmetric(vertical: 8),
        decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.95),
            borderRadius: BorderRadius.circular(30),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 10,
                offset: const Offset(0, 5),
              )
            ]),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildNavItem(Icons.home, 'Akış', 0),
            _buildNavItem(Icons.calendar_today, 'Etkinlikler', 1),
            _buildNavItem(Icons.location_on, 'Mekanlar', 2),
            _buildNavItem(Icons.person, 'Profil', 3),
          ],
        ),
      ),
    );
  }
}
