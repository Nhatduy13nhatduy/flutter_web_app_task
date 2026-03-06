import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_web_app_task/global_widgets/random_image_widget.dart';

class ResponsiveWrapper extends StatelessWidget {
  final Widget child;

  const ResponsiveWrapper({super.key, required this.child});

  bool _isWebDesktop(BuildContext context) {
    if (!kIsWeb) return false;

    final platform = defaultTargetPlatform;
    final isDesktopPlatform =
        platform == TargetPlatform.windows ||
        platform == TargetPlatform.macOS ||
        platform == TargetPlatform.linux;

    final hasMouse = RendererBinding.instance.mouseTracker.mouseIsConnected;
    final shortestSide = MediaQuery.sizeOf(context).shortestSide;
    final isPhoneLayout = shortestSide < 600;
    return (isDesktopPlatform || hasMouse) && !isPhoneLayout;
  }

  @override
  Widget build(BuildContext context) {
    final isDesktopWeb = _isWebDesktop(context);

    if (isDesktopWeb) {
      return Scaffold(
        body: Stack(
          fit: StackFit.expand,
          children: [
            RandomImageWidget(width: 1920, height: 1080, fit: BoxFit.cover),
            Container(
              color: Theme.of(
                context,
              ).colorScheme.onSurface.withValues(alpha: 0.2),
            ),
            Center(
              child: Container(
                width: 360,
                height: 720,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: const [
                    BoxShadow(blurRadius: 20, color: Colors.black26),
                  ],
                ),
                clipBehavior: Clip.antiAlias,
                child: child,
              ),
            ),
          ],
        ),
      );
    } else {
      return child;
    }
  }
}
