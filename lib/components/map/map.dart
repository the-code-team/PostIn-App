import 'package:flutter/material.dart';
import 'package:latlong2/latlong.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:postin_app/components/titles/titleBar.dart';

import 'package:postin_app/pages/eventDetailsPage.dart';

class LocationEvent {
  final LatLng coordinates;
  final String identifier;

  LocationEvent({required this.coordinates, required this.identifier});
}

class MapComponent extends StatelessWidget {
  const MapComponent({Key? key});

  TileLayer get openStreetMapTileLayer => TileLayer(
        urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
        userAgentPackageName: 'dev.fleaflet.flutter_map.exemple',
      );

  List<Marker> getMarkers(
      BuildContext context, List<LocationEvent> locationEvents) {
    return locationEvents.map((event) {
      return Marker(
        width: 80.0,
        height: 80.0,
        point: event.coordinates,
        child: GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) =>
                    eventDetailsPage(eventName: event.identifier),
              ),
            );
          },
          child: Container(
            child: Column(
              children: [
                Icon(Icons.location_on, color: Colors.black, size: 40),
              ],
            ),
          ),
        ),
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    // Ejemplo de lista de eventos de ubicación
    final locationEvents = [
      LocationEvent(
          coordinates: LatLng(38.699575, -0.474774), identifier: 'ID1'),
      LocationEvent(
          coordinates: LatLng(38.699575, -0.471774), identifier: 'ID2'),
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
        MarkerLayer(markers: getMarkers(context, locationEvents)),
        buildTitleBar(context),
      ],
    );
  }
}
