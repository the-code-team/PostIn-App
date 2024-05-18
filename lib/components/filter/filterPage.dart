import 'package:flutter/material.dart';

class EventsFilterPage extends StatefulWidget {
  @override
  _EventsFilterPageState createState() => _EventsFilterPageState();
}

class _EventsFilterPageState extends State<EventsFilterPage> {
  // Variables to store filter states
  bool _isFreeSelected = false;
  bool _isPopularSelected = false;
  bool _isNearbySelected = false;

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
                _isFreeSelected = false;
                _isPopularSelected = false;
                _isNearbySelected = false;
              });
            },
            child: Text(
              'Reset parameters',
              style: TextStyle(
                color: Colors.blue,
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
              'Price',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            SwitchListTile(
              title: Text('Free'),
              value: _isFreeSelected,
              onChanged: (value) {
                setState(() {
                  _isFreeSelected = value;
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
