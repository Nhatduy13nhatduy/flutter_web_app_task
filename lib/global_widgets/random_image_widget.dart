import 'package:flutter/material.dart';

class RandomImageWidget extends StatelessWidget {
  final double width;
  final double height;
  final BoxFit fit;

  const RandomImageWidget({
    super.key,
    required this.width,
    required this.height,
    this.fit = BoxFit.cover,
  });

  @override
  Widget build(BuildContext context) {
    return Image.network(
      'https://picsum.photos/$width/$height',
      width: width,
      height: height,
      fit: fit,
      errorBuilder: (context, error, stackTrace) {
        return Container(
          width: width,
          height: height,
          color: Colors.grey[300],
          child: const Icon(Icons.image_not_supported),
        );
      },
    );
  }
}
