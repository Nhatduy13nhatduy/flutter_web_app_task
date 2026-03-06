import 'package:flutter/material.dart';
import 'package:flutter_web_app_task/features/map/model/map_coordinate.dart';
import 'package:flutter_web_app_task/features/map/model/map_info.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

List<MapInfo> generateMaps() {
  int value = 1;

  return List.generate(13, (i) {
    return MapInfo(
      name: 'A${i + 1}',
      image: 'https://picsum.photos/1400?random=$i',
      coordinates: List.generate(10, (_) {
        return MapCoordinate(
          x: (value % 10) / 10,
          y: ((value + 3) % 10) / 10,
          value: '${value++}',
        );
      }),
    );
  });
}

class _MapScreenState extends State<MapScreen> {
  int _selectedMapIndex = 0;
  final TransformationController _transformationController =
      TransformationController();

  final List<MapInfo> _maps = generateMaps();
  @override
  void initState() {
    super.initState();
    _transformationController.addListener(_onTransformChanged);
  }

  @override
  void dispose() {
    _transformationController.removeListener(_onTransformChanged);
    _transformationController.dispose();
    super.dispose();
  }

  void _onTransformChanged() {
    if (mounted) {
      setState(() {});
    }
  }

  Widget _buildPin(BuildContext context, String value) {
    final colorScheme = Theme.of(context).colorScheme;

    return Container(
      width: 32,
      height: 32,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: colorScheme.primary,
        shape: BoxShape.circle,
      ),
      child: Text(
        value,
        style: TextStyle(
          color: colorScheme.surface,
          fontSize: 10,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final selectedMap = _maps[_selectedMapIndex];

    return Column(
      children: [
        Expanded(
          child: ClipRRect(
            child: LayoutBuilder(
              builder: (context, constraints) {
                final width = constraints.maxWidth;
                final height = constraints.maxHeight;

                return Stack(
                  children: [
                    Positioned.fill(
                      child: InteractiveViewer(
                        transformationController: _transformationController,
                        minScale: 1,
                        maxScale: 5,
                        child: SizedBox(
                          width: width,
                          height: height,
                          child: Image.network(
                            selectedMap.image,
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) {
                              return Container(
                                color: colorScheme.surfaceContainerHighest,
                                alignment: Alignment.center,
                                child: Text(
                                  'Unable to load map image',
                                  style: TextStyle(
                                    color: colorScheme.onSurface,
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    ),
                    IgnorePointer(
                      child: Stack(
                        children: [
                          for (final coordinate in selectedMap.coordinates)
                            _PinPositioned(
                              coordinate: coordinate,
                              width: width,
                              height: height,
                              transformation: _transformationController.value,
                              child: _buildPin(context, coordinate.value),
                            ),
                        ],
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ),
        Container(
          height: 64,
          color: Colors.black.withValues(alpha: 0.85),
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: _maps.length,
            itemBuilder: (context, index) {
              final map = _maps[index];

              return InkWell(
                onTap: () {
                  setState(() {
                    _selectedMapIndex = index;
                    _transformationController.value = Matrix4.identity();
                  });
                },
                child: SizedBox(
                  width: 40,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.map_outlined,
                        size: 16,
                        color: Colors.white,
                      ),
                      const SizedBox(height: 2),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 2),
                        child: Text(
                          map.name,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 10,
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}

class _PinPositioned extends StatelessWidget {
  final MapCoordinate coordinate;
  final double width;
  final double height;
  final Matrix4 transformation;
  final Widget child;

  const _PinPositioned({
    required this.coordinate,
    required this.width,
    required this.height,
    required this.transformation,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    final point = MatrixUtils.transformPoint(
      transformation,
      Offset(coordinate.x * width, coordinate.y * height),
    );

    return Positioned(left: point.dx - 17, top: point.dy - 17, child: child);
  }
}
