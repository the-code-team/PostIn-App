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
            // Utiliza un Switch en lugar de un SwitchListTile para tener más control
            value: _isPopularSelected,
            onChanged: onChanged,
          ),
        ],
      ),
    ],
  );
}
