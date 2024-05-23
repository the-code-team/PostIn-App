import 'package:flutter/material.dart';
import 'package:postin_app/components/filter/components/searchRange.dart';

class EventsFilterPage extends StatefulWidget {
  @override
  _EventsFilterPageState createState() => _EventsFilterPageState();
}

class _EventsFilterPageState extends State<EventsFilterPage> {
  // Variables to store filter states
  bool _isPopularSelected = false;
  RangeValues _priceRange = RangeValues(0, 10000);
  int _searchRange = 100;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Filter'),
        actions: [
          TextButton(
            onPressed: () {
              // Reset all parameters
              setState(() {
                _isPopularSelected = false;
                _priceRange = RangeValues(0, 10000);
                _searchRange = 100;
              });
            },
            child: Text(
              'Reset parameters',
              style: TextStyle(
                color: Theme.of(context).primaryColor,
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            priceRangeSlider(
              context,
              _priceRange,
              (RangeValues values) {
                setState(() {
                  _priceRange = values;
                });
              },
            ),
            Divider(),
            Text(
              'Popularity',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            SwitchListTile(
              title: Text('Popular'),
              value: _isPopularSelected,
              onChanged: (value) {
                setState(() {
                  _isPopularSelected = value;
                });
              },
            ),
            Divider(),
            searchRange(context, _searchRange, (int value) {
              setState(() {
                _searchRange = value;
              });
            }),
            Divider(),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // Apply filters and close the page
                  Navigator.pop(context);
                },
                child: Text('Apply'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

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

Widget priceRangeSlider(BuildContext context, RangeValues _priceRange,
    Function(RangeValues) onChanged) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        'Price Range:',
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
      Text(
        '\$${_priceRange.start.round()} - \$${_priceRange.end.round()}',
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.normal,
        ),
      ),
      SizedBox(height: 10),
      SliderTheme(
        data: SliderThemeData(
          trackHeight: 2.0, // Ancho de la barra del slider
          activeTrackColor: Theme.of(context)
              .primaryColor, // Color principal de la aplicación
        ),
        child: RangeSlider(
          values: _priceRange,
          min: 0,
          max: 10000,
          divisions: 10000,
          onChanged: onChanged,
          labels: RangeLabels(
            '\$${_priceRange.start.round()}',
            '\$${_priceRange.end.round()}',
          ),
          activeColor: Theme.of(context)
              .primaryColor, // Color principal de la aplicación
        ),
      ),
    ],
  );
}
