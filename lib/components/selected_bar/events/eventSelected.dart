import 'package:flutter/material.dart';

class EventListItem extends StatefulWidget {
  final IconData icon;
  final String text;
  final int index;
  final int selectedIndex;
  final Function(int) onTap;

  const EventListItem({
    Key? key,
    required this.icon,
    required this.text,
    required this.index,
    required this.selectedIndex,
    required this.onTap,
  }) : super(key: key);

  @override
  _EventListItemState createState() => _EventListItemState();
}

class _EventListItemState extends State<EventListItem> {
  @override
  Widget build(BuildContext context) {
    bool isSelected = widget.index == widget.selectedIndex;

    return GestureDetector(
      onTap: () {
        widget.onTap(widget.index);
      },
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Transform.scale(
              scale: isSelected ? 1.1 : 1.0,
              child: Icon(
                widget.icon,
                size: 50,
                color: isSelected
                    ? Theme.of(context).primaryColor
                    : Theme.of(context).unselectedWidgetColor,
              ),
            ),
            SizedBox(height: 8),
            Text(
              widget.text,
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
