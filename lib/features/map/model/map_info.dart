import 'package:flutter_web_app_task/features/map/model/map_coordinate.dart';

class MapInfo {
  final String name;
  final String image;
  final List<MapCoordinate> coordinates;

  const MapInfo({
    required this.name,
    required this.image,
    required this.coordinates,
  });
}
