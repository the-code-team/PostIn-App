import 'package:flutter/material.dart';
import 'package:postin_app/components/search_bar/searchBar.dart';
import 'package:postin_app/components/map/map.dart';
import 'package:postin_app/components/selected_bar/eventSelected.dart';

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
          SizedBox(
            height: 100, // Desired height for the list of items
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                EventListItem(
                  icon: Icons.home,
                  text: "Home",
                  index: 0,
                  selectedIndex: selectedIndex,
                  onTap: (index) {
                    setState(() {
                      selectedIndex = index;
                    });
                  },
                ),
                EventListItem(
                  icon: Icons.work,
                  text: "Work",
                  index: 1,
                  selectedIndex: selectedIndex,
                  onTap: (index) {
                    setState(() {
                      selectedIndex = index;
                    });
                  },
                ),
                EventListItem(
                  icon: Icons.school,
                  text: "School",
                  index: 2,
                  selectedIndex: selectedIndex,
                  onTap: (index) {
                    setState(() {
                      selectedIndex = index;
                    });
                  },
                ),
                // Add more items as needed
              ],
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
