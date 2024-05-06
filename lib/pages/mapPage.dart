import 'package:flutter/material.dart';
import 'package:postin_app/components/titles/titleBar.dart';
import 'package:postin_app/components/map/map.dart';
import 'package:postin_app/components/selected_bar/events/eventSelected.dart';
import 'package:postin_app/components/selected_bar/selectedEventBar.dart';

class MapPage extends StatefulWidget {
  const MapPage({Key? key});

  @override
  _MapPageState createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  int selectedIndex = 0; // State that stores the index of the selected item

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          buildTitleBar(context),
          EventListWidget(
            selectedIndex: selectedIndex,
            onTap: (index) {
              setState(() {
                selectedIndex = index;
              });
            },
          ),
          Expanded(
            child: MapComponent(),
          ),
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
