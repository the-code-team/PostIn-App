import 'package:flutter/material.dart';

class SearchRange extends StatefulWidget {
  final int initialRangeValue;

  SearchRange({required this.initialRangeValue});

  @override
  _SearchRangeState createState() => _SearchRangeState();
}

class _SearchRangeState extends State<SearchRange> {
  late double _currentRangeValue;
  final double _maxRangeValue = 100;

  @override
  void initState() {
    super.initState();
    _currentRangeValue = widget.initialRangeValue.toDouble();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search Range'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Expanded(
              child: Center(
                child: Image.asset(
                  'assets/map_image.png', // Reemplaza esto con la imagen de tu mapa
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(height: 20),
            Text(
              _currentRangeValue == _maxRangeValue
                  ? 'Sin límites'
                  : 'Hasta a ${_currentRangeValue.round()} km de mí',
              style: TextStyle(fontSize: 18),
            ),
            Slider(
              value: _currentRangeValue,
              min: 10,
              max: _maxRangeValue,
              divisions: 20,
              label: _currentRangeValue == _maxRangeValue
                  ? 'Sin límites'
                  : _currentRangeValue.round().toString(),
              onChanged: (double value) {
                setState(() {
                  _currentRangeValue = value;
                });
              },
            ),
            SizedBox(height: 20),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // Implementar la funcionalidad de búsqueda aquí
                  if (_currentRangeValue == _maxRangeValue) {
                    print('Buscar sin límites');
                  } else {
                    print('Buscar a ${_currentRangeValue.round()} km de mí');
                  }
                },
                child: Text(
                  _currentRangeValue == _maxRangeValue
                      ? 'Buscar sin límites'
                      : 'Buscar a ${_currentRangeValue.round()} km de mí',
                ),
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  textStyle: TextStyle(fontSize: 16),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
