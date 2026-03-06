import 'package:flutter/material.dart';
import 'package:flutter_web_app_task/features/home/widget/location_card_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Home'),
        actions: [
          IconButton(
            onPressed: () {},
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
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: const [
            LocationCardWidget(title: 'Da Nang, Viet Nam'),
            SizedBox(height: 16),
            LocationCardWidget(title: 'Hoi An, Viet Nam'),
          ],
        ),
      ),
    );
  }
}
