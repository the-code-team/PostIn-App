import 'package:flutter/material.dart';
import 'package:postin_app/components/filter/components/searchRange.dart';

Widget searchRange(
  BuildContext context,
  int _searchRange,
  Function(int) onRangeChanged,
) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        'Search Range',
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
      SizedBox(height: 10),
      GestureDetector(
        onTap: () async {
          // Navigate to another screen
          final result = await Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => SearchRange(
                initialRangeValue: _searchRange,
              ),
            ),
          );

          if (result != null) {
            onRangeChanged(int.parse(result.toString()));
          }
        },
        child: Row(
          children: [
            Icon(Icons.location_on_outlined, size: 30),
            SizedBox(width: 10),
            Text(
              'View search range: $_searchRange km',
              style: TextStyle(
                color: Theme.of(context).primaryColor,
                fontSize: 20,
              ),
            ),
          ],
        ),
      ),
      SizedBox(height: 10),
    ],
  );
}
