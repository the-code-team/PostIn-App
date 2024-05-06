import 'package:flutter/material.dart';
import 'package:postin_app/components/selected_bar/events/eventSelected.dart';

class EventListWidget extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onTap;

  const EventListWidget({
    required this.selectedIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          EventListItem(
            icon: Icons.home,
            text: "Home",
            index: 0,
            selectedIndex: selectedIndex,
            onTap: onTap,
          ),
          EventListItem(
            icon: Icons.work,
            text: "Work",
            index: 1,
            selectedIndex: selectedIndex,
            onTap: onTap,
          ),
          EventListItem(
            icon: Icons.school,
            text: "School",
            index: 2,
            selectedIndex: selectedIndex,
            onTap: onTap,
          ),
          // Add more items as needed
        ],
      ),
    );
  }
}
