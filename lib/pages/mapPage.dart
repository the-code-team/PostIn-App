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
  bool isEventListVisible = false; // State to control the visibility of EventListWidget

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          buildTitleBar(context, () {
            setState(() {
              isEventListVisible = !isEventListVisible; // Toggle visibility of EventListWidget
            });
          }),
          AnimatedCrossFade(
            duration: const Duration(milliseconds: 300),
            crossFadeState: isEventListVisible ? CrossFadeState.showSecond : CrossFadeState.showFirst,
            firstChild: Container(), // Container for collapsed state
            secondChild: EventListWidget( // EventListWidget for expanded state
              selectedIndex: selectedIndex,
              onTap: (index) {
                setState(() {
                  selectedIndex = index;
                });
              },
            ),
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
