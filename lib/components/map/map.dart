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

  List<Marker> getMarkers() {
    return [
      Marker(
        width: 80.0,
        height: 80.0,
        point: LatLng(38.699575, -0.474774),
        child: Container(
          child: Icon(Icons.location_on, color: Colors.red, size: 40),
        ),
      ),
      // Añade más marcadores aquí si es necesario
    ];
  }

  @override
  Widget build(BuildContext context) {
    return FlutterMap(
      options: const MapOptions(
        center: LatLng(38.699575, -0.474774),
        zoom: 11,
        interactiveFlags:
            InteractiveFlag.all & ~InteractiveFlag.doubleTapDragZoom,
      ),
      children: [
        openStreetMapTileLayer,
        MarkerLayer(markers: getMarkers()),
        buildTitleBar(context),
      ],
    );
  }
}
