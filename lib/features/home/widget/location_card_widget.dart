import 'package:flutter/material.dart';
import 'package:flutter_web_app_task/global_widgets/random_image_widget.dart';

class LocationCardWidget extends StatelessWidget {
  final String title;

  const LocationCardWidget({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: Card(
        margin: EdgeInsets.zero,
        elevation: 4,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const AspectRatio(
              aspectRatio: 16 / 9,
              child: RandomImageWidget(
                width: 1200,
                height: 675,
                fit: BoxFit.cover,
              ),
            ),
            Container(
              color: colorScheme.primary,
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
              child: Text(
                title,
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  color: colorScheme.surface,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
