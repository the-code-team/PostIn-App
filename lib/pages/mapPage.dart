import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class MapPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FlutterMap(
        options: const MapOptions(
          initialCenter: LatLng(38.699575, -0.474774),
          initialZoom: 11,
          interactionOptions: InteractionOptions(
            flags: ~InteractiveFlag.doubleTapDragZoom,
          ),
        ),
        children: [
          openStreetMapTileLayer,
          buildSearchField(),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {},
        child: const Icon(Icons.add, color: Colors.white),
      ),
    );
  }

  TileLayer get openStreetMapTileLayer => TileLayer(
        urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
        userAgentPackageName: 'dev.fleaflet.flutter_map.exemple',
      );

  Widget buildSearchField() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 35, horizontal: 16),
      child: TextFormField(
        autofocus: false, // Esto es para que se abra el teclado automaticamente
        autofillHints: [AutofillHints.email],
        obscureText: false,
        decoration: InputDecoration(
          labelText: 'Post-In',
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(40),
            borderSide: BorderSide(width: 2),
          ),
          filled: true,
          contentPadding: EdgeInsets.symmetric(vertical: 24, horizontal: 24),
          suffixIcon: Icon(Icons.filter_list_outlined),
        ),
        keyboardType: TextInputType.emailAddress,
      ),
    );
  }
}
