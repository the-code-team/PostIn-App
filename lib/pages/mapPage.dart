import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

// Tutorial: https://www.youtube.com/watch?v=ZnZM8ot5lcc
// Documentación oficial: https://docs-fleaflet-dev.translate.goog/?_x_tr_sl=auto&_x_tr_tl=es&_x_tr_hl=es&_x_tr_hist=true
// https://pub.dev/packages/flutter_map/example

class MapPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FlutterMap(
          options: MapOptions(
            initialCenter: LatLng(38.699575, -0.474774),
            initialZoom: 11,
            interactionOptions:
                InteractionOptions(flags: ~InteractiveFlag.doubleTapDragZoom),
          ),
          children: [
            openStreetMapTileLayer,
          ]),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {},
        child: const Icon(Icons.add, color: Colors.white),
      ),
    );
  }
}

TileLayer get openStreetMapTileLayer => TileLayer(
      urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
      userAgentPackageName: 'dev.fleaflet.flutter_map.exemple',
    );
