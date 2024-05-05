import 'package:flutter/material.dart';
import 'package:postin_app/components/search_bar/searchBar.dart';
import 'package:postin_app/components/map/map.dart';

class MapPage extends StatelessWidget {
  const MapPage({super.key});

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
          buildSearchField(context),
          // The expanded helps us so that the FlutterMap is not infinite. If the FlutterMap is infinite it cannot be placed in a column
          Expanded(child: MapComponent()),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {},
        backgroundColor: Theme.of(context).primaryColor,
        shape: const CircleBorder(),
        child: const Icon(Icons.add, color: Colors.white),
      ),
    );
  }
}
