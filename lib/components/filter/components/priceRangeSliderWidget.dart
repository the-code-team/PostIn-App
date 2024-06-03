import 'package:flutter/material.dart';

Widget priceRangeSlider(
    BuildContext context,
    bool _isFreeRangeSelected,
    RangeValues _priceRange,
    Function(RangeValues) onChanged,
    Function(bool) onSwitchChanged) {
  String rangPrice;
  int max = 10000;

  if (_priceRange.start == 0 && _priceRange.end == 0) {
    rangPrice = 'Gratis';
  } else if (_priceRange.start == 0 && _priceRange.end == max) {
    rangPrice = '0 - Sin límite';
  } else {
    rangPrice = '\$${_priceRange.start.round()} - \$${_priceRange.end.round()}';
  }

  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Row(
        children: [
          Text(
            'Rango de precios:',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          Switch(
            value: _isFreeRangeSelected,
            onChanged: (bool value) {
              onSwitchChanged(value);
              if (value) {
                onChanged(RangeValues(0, 0));
              }
            },
          ),
        ],
      ),
      Text(
        rangPrice,
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
          max: max * 1.0,
          divisions: max,
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
