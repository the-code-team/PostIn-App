import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

// Tutorial: https://www.youtube.com/watch?v=ZnZM8ot5lcc

class MapPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FlutterMap(
        options: MapOptions(
          initialCenter: LatLng(38.699575, -0.474774),
          initialZoom: 11,
          interactionOptions:
              InteractionOptions(flags: ~InteractiveFlag.doubleTapDragZoom),
        ),
        children: [
          openStreetMapTileLayer,
        ]);
  }
}

TileLayer get openStreetMapTileLayer => TileLayer(
      urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
      userAgentPackageName: 'dev.fleaflet.flutter_map.exemple',
    );
