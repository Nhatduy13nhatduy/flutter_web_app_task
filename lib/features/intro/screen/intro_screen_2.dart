import 'package:flutter/material.dart';
import 'package:flutter_web_app_task/global_widgets/random_image_widget.dart';
import 'package:flutter_web_app_task/routers/app_router.dart';

class IntroScreen2 extends StatefulWidget {
  const IntroScreen2({super.key});

  @override
  State<IntroScreen2> createState() => _IntroScreen2State();
}

class _IntroScreen2State extends State<IntroScreen2> {
  bool _showImageInfoCard = true;
  bool _useThreeTwoRatio = false;

  final List<String> _paragraphs = const [
    'Welcome to your next adventure. This app helps you explore places, stories, and hidden corners around your city.',
    'Swipe, scroll, and discover useful recommendations prepared for both quick trips and full-day plans.',
    'You can save favorite destinations, track where you have been, and share ideas with your friends.',
    'Everything is designed to keep planning simple so you can spend more time enjoying the journey.',
    'Start with a map, choose a route, and let each day become a new memory.',
  ];

  void _onSkip() {
    Navigator.of(context).pop();
  }

  void _onContinue() {
    Navigator.pushNamed(context, AppRouter.navbar);
  }

  void _toggleImageLayout() {
    setState(() {
      _showImageInfoCard = !_showImageInfoCard;
      _useThreeTwoRatio = !_useThreeTwoRatio;
    });
  }

  @override
  Widget build(BuildContext context) {
    final imageAspectRatio = _useThreeTwoRatio ? 16 / 9 : 4 / 3;

    return Scaffold(
      body: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: _toggleImageLayout,
        child: Stack(
          children: [
            SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Stack(
                    clipBehavior: Clip.none,
                    children: [
                      AspectRatio(
                        aspectRatio: imageAspectRatio,
                        child: const RandomImageWidget(
                          width: 1200,
                          height: 900,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Positioned(
                        right: 0,
                        left: 0,
                        bottom: 0,
                        child: _showImageInfoCard
                            ? Center(
                                child: Container(
                                  key: const ValueKey('image_info_card'),
                                  width: 220,
                                  padding: const EdgeInsets.all(16),
                                  decoration: BoxDecoration(
                                    color: Theme.of(
                                      context,
                                    ).colorScheme.surface,
                                    borderRadius: BorderRadius.circular(12),
                                    boxShadow: const [
                                      BoxShadow(
                                        color: Colors.black26,
                                        blurRadius: 10,
                                        offset: Offset(0, 4),
                                      ),
                                    ],
                                  ),
                                  child: Center(
                                    child: Text(
                                      'Hello world!',
                                      style: Theme.of(
                                        context,
                                      ).textTheme.bodyMedium,
                                    ),
                                  ),
                                ),
                              )
                            : const SizedBox.shrink(),
                      ),
                    ],
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      padding: const EdgeInsets.fromLTRB(20, 20, 20, 220),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
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
              bottom: 24,
              child: SafeArea(
                top: false,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      width: 40,
                      height: 40,
                      margin: const EdgeInsets.only(bottom: 12),
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.primary,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.map_outlined,
                          color: Theme.of(context).colorScheme.surface,
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: SizedBox(
                            height: 40,
                            child: FilledButton(
                              style: FilledButton.styleFrom(
                                backgroundColor: Theme.of(
                                  context,
                                ).colorScheme.primary,
                                foregroundColor: Theme.of(
                                  context,
                                ).colorScheme.surface,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                              onPressed: _onSkip,
                              child: const Text('Skip'),
                            ),
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: SizedBox(
                            height: 40,
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: FilledButton(
                                style: FilledButton.styleFrom(
                                  backgroundColor: Theme.of(
                                    context,
                                  ).colorScheme.primary,
                                  foregroundColor: Theme.of(
                                    context,
                                  ).colorScheme.surface,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                ),
                                onPressed: _onContinue,
                                child: const Text('Continue'),
                              ),
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
      ),
    );
  }
}
