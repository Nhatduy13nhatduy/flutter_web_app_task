import 'package:flutter/material.dart';
import 'package:flutter_web_app_task/global_widgets/random_image_widget.dart';

class IntroScreen2 extends StatefulWidget {
  const IntroScreen2({super.key});

  @override
  State<IntroScreen2> createState() => _IntroScreen2State();
}

class _IntroScreen2State extends State<IntroScreen2> {
  final List<String> _paragraphs = const [
    'Welcome to your next adventure. This app helps you explore places, stories, and hidden corners around your city.',
    'Swipe, scroll, and discover useful recommendations prepared for both quick trips and full-day plans.',
    'You can save favorite destinations, track where you have been, and share ideas with your friends.',
    'Everything is designed to keep planning simple so you can spend more time enjoying the journey.',
    'Start with a map, choose a route, and let each day become a new memory.',
  ];

  void _showMapMessage() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Map feature is coming soon.')),
    );
  }

  void _onSkip() {
    Navigator.of(context).pop();
  }

  void _onContinue() {
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(const SnackBar(content: Text('Continue to the next step.')));
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      body: Stack(
        children: [
          SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const AspectRatio(
                  aspectRatio: 4 / 3,
                  child: RandomImageWidget(
                    width: 1200,
                    height: 900,
                    fit: BoxFit.cover,
                  ),
                ),
                Expanded(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.fromLTRB(20, 20, 20, 220),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Discover The World',
                          style: Theme.of(context).textTheme.headlineSmall
                              ?.copyWith(fontWeight: FontWeight.w700),
                        ),
                        const SizedBox(height: 14),
                        ..._paragraphs.map(
                          (paragraph) => Padding(
                            padding: const EdgeInsets.only(bottom: 12),
                            child: Text(
                              paragraph,
                              style: Theme.of(context).textTheme.bodyLarge,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            left: 20,
            right: 20,
            bottom: 28,
            child: SafeArea(
              top: false,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    width: 56,
                    height: 56,
                    margin: const EdgeInsets.only(bottom: 16),
                    decoration: BoxDecoration(
                      color: colorScheme.primary,
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: colorScheme.primary.withValues(alpha: 0.3),
                          blurRadius: 16,
                          offset: const Offset(0, 8),
                        ),
                      ],
                    ),
                    child: IconButton(
                      onPressed: _showMapMessage,
                      icon: Icon(
                        Icons.map_outlined,
                        color: colorScheme.surface,
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: SizedBox(
                          height: 52,
                          child: FilledButton(
                            style: FilledButton.styleFrom(
                              backgroundColor: colorScheme.primary,
                              foregroundColor: colorScheme.surface,
                            ),
                            onPressed: _onSkip,
                            child: const Text('Skip'),
                          ),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: SizedBox(
                          height: 52,
                          child: FilledButton(
                            style: FilledButton.styleFrom(
                              backgroundColor: colorScheme.primary,
                              foregroundColor: colorScheme.surface,
                            ),
                            onPressed: _onContinue,
                            child: const Text('Continue'),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
