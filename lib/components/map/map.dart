import 'package:flutter/material.dart';
import 'package:latlong2/latlong.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:postin_app/components/titles/titleBar.dart';

class MapComponent extends StatelessWidget {
  const MapComponent({Key? key});

  TileLayer get openStreetMapTileLayer => TileLayer(
        urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
        userAgentPackageName: 'dev.fleaflet.flutter_map.exemple',
      );

  @override
  Widget build(BuildContext context) {
    return FlutterMap(
      options: const MapOptions(
        initialCenter: LatLng(38.699575, -0.474774),
        initialZoom: 11,
        interactionOptions: InteractionOptions(
          flags: ~InteractiveFlag.doubleTapDragZoom,
        ),
      ),
      children: [
        openStreetMapTileLayer,
        buildTitleBar(context),
      ],
    );
  }
}
