import 'package:flutter/material.dart';

import 'package:postin_app/components/map/map.dart';
import 'package:postin_app/components/buttons/addEventFloatingActionButton.dart';

class MapPage extends StatefulWidget {
  const MapPage({Key? key});

  @override
  _MapPageState createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: MapComponent(),
          ),
        ],
      ),
      floatingActionButton: addEventFloatingActionButton(context),
    );
  }
}
