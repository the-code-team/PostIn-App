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

// Seleccionamos un rango de fechas desde el dia de hoy hasta el mes que viene
  RangeValues _rangeDates = RangeValues(
    DateTime.now().millisecondsSinceEpoch.toDouble(),
    DateTime.utc(
            DateTime.now().year, DateTime.now().month + 1, DateTime.now().day)
        .millisecondsSinceEpoch
        .toDouble(),
  );

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
            popularity(_isPopularSelected, (value) {
              setState(() {
                _isPopularSelected = value;
              });
            }),
            Divider(),
            searchRange(context, _searchRange, (int value) {
              setState(() {
                _searchRange = value;
              });
            }),
            Divider(),
            rangeDates(context, _rangeDates, (RangeValues values) {
              setState(() {
                _rangeDates = values;
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

Widget rangeDates(
  BuildContext context,
  RangeValues _rangeDates,
  Function(RangeValues) onDateChanged,
) {
  // Convertimos las fechas en formato legible
  String _formattedDate(double milliseconds) {
    final date = DateTime.fromMillisecondsSinceEpoch(milliseconds.toInt());
    return '${date.day}/${date.month}/${date.year}';
  }

  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        'Date Range',
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
      SizedBox(height: 5),
      GestureDetector(
        onTap: () async {
          final DateTimeRange? picked = await showDateRangePicker(
            context: context,
            firstDate: DateTime(2000),
            lastDate: DateTime(2100),
            initialDateRange: DateTimeRange(
              start: DateTime.now().subtract(Duration(days: 7)),
              end: DateTime.now(),
            ),
          );
          if (picked != null) {
            onDateChanged(RangeValues(
              picked.start.millisecondsSinceEpoch.toDouble(),
              picked.end.millisecondsSinceEpoch.toDouble(),
            ));
          }
        },
        child: Row(
          children: [
            Icon(Icons.date_range, size: 30),
            Column(
              children: [
                SizedBox(width: 10),
                Text(
                  '  Select date range',
                  style: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontSize: 20,
                  ),
                ),
                Text(
                  '    ${_formattedDate(_rangeDates.start)} - ${_formattedDate(_rangeDates.end)}',
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    ],
  );
}

Widget priceRangeSlider(BuildContext context, RangeValues _priceRange,
    Function(RangeValues) onChanged) {
  String rangPrice;
  int max = 10000;

  if (_priceRange.start == 0 && _priceRange.end == 0) {
    rangPrice = 'Free';
  } else if (_priceRange.start == 0 && _priceRange.end == max) {
    rangPrice = '0 - No limit';
  } else {
    rangPrice = '\$${_priceRange.start.round()} - \$${_priceRange.end.round()}';
  }

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
          max: max * 1,
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
