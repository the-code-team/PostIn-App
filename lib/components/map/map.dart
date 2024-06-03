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

  List<Marker> getMarkers(List<LatLng> coordinates, List<String> identifiers) {
    return List.generate(coordinates.length, (index) {
      return Marker(
        width: 80.0,
        height: 80.0,
        point: coordinates[index],
        child: Container(
          child: Column(
            children: [
              Icon(Icons.location_on, color: Colors.red, size: 40),
              Text(identifiers[index], style: TextStyle(color: Colors.black)),
            ],
          ),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    // Ejemplo de coordenadas e identificadores
    final coordinates = [
      LatLng(38.699575, -0.474774),
      LatLng(38.699585, -0.472564),
      // Añade más coordenadas si es necesario
    ];
    final identifiers = [
      'ID1',
      'ID2',
      // Añade más identificadores si es necesario
    ];

    return FlutterMap(
      options: const MapOptions(
        center: LatLng(38.699575, -0.474774),
        zoom: 11,
        interactiveFlags:
            InteractiveFlag.all & ~InteractiveFlag.doubleTapDragZoom,
      ),
      children: [
        openStreetMapTileLayer,
        MarkerLayer(markers: getMarkers(coordinates, identifiers)),
        buildTitleBar(context),
      ],
    );
  }
}
