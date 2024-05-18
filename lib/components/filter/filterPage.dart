import 'package:flutter/material.dart';

class EventsFilterPage extends StatefulWidget {
  @override
  _EventsFilterPageState createState() => _EventsFilterPageState();
}

class _EventsFilterPageState extends State<EventsFilterPage> {
  // Variables to store filter states
  bool _isPopularSelected = false;
  bool _isNearbySelected = false;
  RangeValues _priceRange = RangeValues(0, 10000);

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
                _isNearbySelected = false;
                _priceRange = RangeValues(0, 10000);
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
              ),
              child: RangeSlider(
                values: _priceRange,
                min: 0,
                max: 10000,
                divisions: 10000,
                onChanged: (RangeValues values) {
                  setState(() {
                    _priceRange = values;
                  });
                },
                labels: RangeLabels(
                  '\$${_priceRange.start.round()}',
                  '\$${_priceRange.end.round()}',
                ),
                activeColor: Theme.of(context)
                    .primaryColor, // Color principal de la aplicación
              ),
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
            Text(
              'Near you',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            SwitchListTile(
              title: Text('Nearby'),
              value: _isNearbySelected,
              onChanged: (value) {
                setState(() {
                  _isNearbySelected = value;
                });
              },
            ),
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
