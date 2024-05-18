import 'package:flutter/material.dart';

class EventsFilterPage extends StatefulWidget {
  @override
  _EventsFilterPageState createState() => _EventsFilterPageState();
}

class _EventsFilterPageState extends State<EventsFilterPage> {
  // Variables para almacenar los estados de los filtros
  bool _isFreeSelected = false;
  bool _isPopularSelected = false;
  bool _isNearbySelected = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Filtrar'),
        actions: [
          TextButton(
            onPressed: () {
              // Restablecer todos los parámetros
              setState(() {
                _isFreeSelected = false;
                _isPopularSelected = false;
                _isNearbySelected = false;
              });
            },
            child: Text(
              'Restablecer parámetros',
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
              'Precio',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            SwitchListTile(
              title: Text('Gratis'),
              value: _isFreeSelected,
              onChanged: (value) {
                setState(() {
                  _isFreeSelected = value;
                });
              },
            ),
            Divider(),
            Text(
              'Popularidad',
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
              'Cerca de ti',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            SwitchListTile(
              title: Text('Cercanos'),
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
                  // Aplicar filtros y cerrar la página
                  Navigator.pop(context);
                },
                child: Text('Aplicar'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
