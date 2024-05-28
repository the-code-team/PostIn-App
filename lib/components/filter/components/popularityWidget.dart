import 'package:flutter/material.dart';

Widget popularity(bool _isPopularSelected, Function(bool) onChanged) {
  return Column(
    crossAxisAlignment:
        CrossAxisAlignment.start, // Alinea el contenido a la izquierda
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment
            .spaceBetween, // Alinea los elementos a los extremos
        children: [
          Text(
            'Popularity',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          Switch(
            value: _isPopularSelected,
            onChanged: onChanged,
          ),
        ],
      ),
      if (_isPopularSelected)
        Padding(
          padding: const EdgeInsets.only(top: 10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Select a range:',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    children: [
                      Icon(Icons.person, size: 30),
                      Text('2-5'),
                    ],
                  ),
                  Column(
                    children: [
                      Icon(Icons.person, size: 30),
                      Text('5-10'),
                    ],
                  ),
                  Column(
                    children: [
                      Icon(Icons.person, size: 30),
                      Text('10-25'),
                    ],
                  ),
                  Column(
                    children: [
                      Icon(Icons.person, size: 30),
                      Text('25-50'),
                    ],
                  ),
                  Column(
                    children: [
                      Icon(Icons.person, size: 30),
                      Text('50-100'),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
    ],
  );
}
