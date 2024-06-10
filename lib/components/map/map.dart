import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter/material.dart';
import 'package:latlong2/latlong.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:postin_app/components/titles/titleBar.dart';
import 'package:postin_app/pages/eventDetailsPageAddEvent.dart';

class LocationEvent {
  final LatLng coordinates;
  final String identifier;

  LocationEvent({required this.coordinates, required this.identifier});

  factory LocationEvent.fromJson(Map<String, dynamic> json) {
    return LocationEvent(
      coordinates: LatLng(
          json['coordinates']['latitude'], json['coordinates']['longitude']),
      identifier: json['identifier'],
    );
  }
}

class MapComponent extends StatefulWidget {
  const MapComponent({Key? key}) : super(key: key);

  @override
  _MapComponentState createState() => _MapComponentState();
}

class _MapComponentState extends State<MapComponent> {
  late Future<List<LocationEvent>> locationEventsFuture;

  @override
  void initState() {
    super.initState();
    locationEventsFuture = loadLocationEvents();
  }

  Future<List<LocationEvent>> loadLocationEvents() async {
    final String response =
        await rootBundle.loadString('assets/location_events.json');
    final List<dynamic> data = json.decode(response);
    return data.map((json) => LocationEvent.fromJson(json)).toList();
  }

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
                    EventDetailsPageAddEvent(eventName: event.identifier),
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
    return FutureBuilder<List<LocationEvent>>(
      future: locationEventsFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return Center(child: Text('No events found.'));
        } else {
          return FlutterMap(
            options: const MapOptions(
              center: LatLng(38.699575, -0.474774),
              zoom: 11,
              interactiveFlags:
                  InteractiveFlag.all & ~InteractiveFlag.doubleTapDragZoom,
            ),
            children: [
              openStreetMapTileLayer,
              MarkerLayer(markers: getMarkers(context, snapshot.data!)),
              buildTitleBar(context),
            ],
          );
        }
      },
    );
  }
}
