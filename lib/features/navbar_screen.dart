import 'package:flutter/material.dart';
import 'package:flutter_web_app_task/features/home/screen/home_screen.dart';
import 'package:flutter_web_app_task/features/home/widget/language_card_widget.dart';
import 'package:flutter_web_app_task/features/map/screen/map_screen.dart';
import 'package:flutter_web_app_task/features/phone/screen/phone_screen.dart';

class NavbarScreen extends StatefulWidget {
  const NavbarScreen({super.key});

  @override
  State<NavbarScreen> createState() => _NavbarScreenState();
}

class _NavbarScreenState extends State<NavbarScreen> {
  int _selectedIndex = 0;

  static const List<Map<String, String>> _languages = [
    {'name': 'English', 'flag': 'https://flagcdn.com/w160/gb.png'},
    {'name': 'Vietnamese', 'flag': 'https://flagcdn.com/w160/vn.png'},
    {'name': 'Japanese', 'flag': 'https://flagcdn.com/w160/jp.png'},
    {'name': 'Chinese', 'flag': 'https://flagcdn.com/w160/cn.png'},
    {'name': 'French', 'flag': 'https://flagcdn.com/w160/fr.png'},
    {'name': 'German', 'flag': 'https://flagcdn.com/w160/de.png'},
  ];

  static const List<String> _titles = ['Home', 'Phone', 'Map'];

  late final List<Widget> _pages = const [
    HomeScreen(),
    PhoneScreen(),
    MapScreen(),
  ];

  void _showLanguageDialog(BuildContext context) {
    showDialog<void>(
      context: context,
      useRootNavigator: false,
      builder: (dialogContext) {
        return AlertDialog(
          insetPadding: const EdgeInsets.symmetric(
            horizontal: 12,
            vertical: 24,
          ),
          title: const Text('Language'),
          content: ConstrainedBox(
            constraints: const BoxConstraints(maxHeight: 420),
            child: SizedBox(
              width: double.maxFinite,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    for (var i = 0; i < _languages.length; i++) ...[
                      LanguageCardWidget(
                        text: _languages[i]['name']!,
                        imageUrl: _languages[i]['flag']!,
                        onTap: () => Navigator.of(dialogContext).pop(),
                      ),
                      if (i != _languages.length - 1)
                        const SizedBox(height: 10),
                    ],
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Theme.of(context).colorScheme.surface,
        iconTheme: IconThemeData(color: Theme.of(context).colorScheme.surface),
        actionsIconTheme: IconThemeData(
          color: Theme.of(context).colorScheme.surface,
        ),
        centerTitle: true,
        title: Text(_titles[_selectedIndex]),
        actions: [
          IconButton(
            onPressed: () => _showLanguageDialog(context),
            icon: const Icon(Icons.public),
            tooltip: 'Global',
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.qr_code_scanner),
            tooltip: 'QR',
          ),
        ],
      ),
      body: IndexedStack(index: _selectedIndex, children: _pages),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (index) => setState(() => _selectedIndex = index),
        type: BottomNavigationBarType.fixed,
        backgroundColor: Theme.of(context).colorScheme.primary,
        selectedItemColor: Theme.of(context).colorScheme.onSurface,
        unselectedItemColor: Theme.of(context).colorScheme.surface,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home_filled), label: 'Home'),
          BottomNavigationBarItem(
            icon: Icon(Icons.phone_android),
            label: 'Phone',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.map), label: 'Map'),
        ],
      ),
    );
  }
}
