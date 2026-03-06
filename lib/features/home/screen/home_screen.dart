import 'package:flutter/material.dart';
import 'package:flutter_web_app_task/features/home/widget/location_card_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: const [
          LocationCardWidget(title: 'Da Nang, Viet Nam'),
          SizedBox(height: 16),
          LocationCardWidget(title: 'Hoi An, Viet Nam'),
        ],
      ),
    );
  }
}
