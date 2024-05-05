import 'package:flutter/material.dart';
import 'package:postin_app/components/search_bar/searchBar.dart';
import 'package:postin_app/components/map/map.dart';

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
                buildListEvent(Icons.home, "Home", 0),
                buildListEvent(Icons.work, "Work", 1),
                buildListEvent(Icons.school, "School", 2),
                buildListEvent(Icons.home, "Home", 3),
                buildListEvent(Icons.work, "Work", 4),
                buildListEvent(Icons.school, "School", 5),
                buildListEvent(Icons.home, "Home", 6),
                buildListEvent(Icons.work, "Work", 7),
                buildListEvent(Icons.school, "School", 8),
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

  Widget buildListEvent(IconData icon, String text, int index) {
    // Determine if this item is selected or not
    final bool isSelected = index == selectedIndex;

    return GestureDetector(
      onTap: () {
        // Update the state when an item is selected
        setState(() {
          selectedIndex = index;
        });
      },
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: 8), // Horizontal spacing between items
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Apply a scale animation when the button is pressed
            Transform.scale(
              scale: isSelected ? 1.1 : 1.0, // Increased scale when selected
              child: Icon(
                icon,
                size: 50,
                color: isSelected
                    ? Theme.of(context).primaryColor
                    : Theme.of(context).unselectedWidgetColor,
              ),
            ),
            SizedBox(height: 8), // Spacing between icon and text
            Text(
              text,
              style: TextStyle(fontSize: 16), // Font size of the text
            ), // Text below the icon
          ],
        ),
      ),
    );
  }
}
