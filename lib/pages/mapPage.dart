import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class MapPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          buildSearchField(context),
          // The expanded helps us so that the FlutterMap is not infinite. If the FlutterMap is infinite it cannot be placed in a column
          Expanded(
            child: FlutterMap(
              options: MapOptions(
                initialCenter: LatLng(38.699575, -0.474774),
                initialZoom: 11,
                interactionOptions: InteractionOptions(
                  flags: ~InteractiveFlag.doubleTapDragZoom,
                ),
              ),
              children: [
                openStreetMapTileLayer,
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {},
        backgroundColor: Theme.of(context).primaryColor,
        child: const Icon(Icons.add, color: Colors.white),
        shape: CircleBorder(),
      ),
    );
  }

  TileLayer get openStreetMapTileLayer => TileLayer(
        urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
        userAgentPackageName: 'dev.fleaflet.flutter_map.exemple',
      );

  Widget buildSearchField(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(
          16, 35, 16, 15), // Ajusta el padding superior aquí
      child: Theme(
        data: Theme.of(context).copyWith(
          inputDecorationTheme: InputDecorationTheme(
            filled: true,
            fillColor: Theme.of(context).primaryColor.withOpacity(0.1),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(40),
              borderSide:
                  BorderSide(color: Theme.of(context).primaryColor, width: 2),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(40),
              borderSide:
                  BorderSide(color: Theme.of(context).primaryColor, width: 2),
            ),
            labelStyle: TextStyle(
                color: Theme.of(context)
                    .primaryColor), // Cambia el color de la etiqueta
            hintStyle: TextStyle(
                color: Theme.of(context).primaryColor.withOpacity(
                    0.5)), // Cambia el color del texto de sugerencia
          ),
          textSelectionTheme: TextSelectionThemeData(
            cursorColor:
                Theme.of(context).primaryColor, // Cambia el color del cursor
          ),
        ),
        child: TextFormField(
          autofocus: false,
          autofillHints: [AutofillHints.email],
          obscureText: false,
          decoration: InputDecoration(
            labelText: 'Post-In',
            contentPadding: EdgeInsets.symmetric(vertical: 15, horizontal: 24),
            suffixIcon: Icon(Icons.filter_list_outlined),
          ),
          keyboardType: TextInputType.emailAddress,
        ),
      ),
    );
  }
}
