import 'package:flutter/material.dart';
import 'package:postin_app/components/filter/components/priceRangeSliderWidget.dart';
import 'package:postin_app/components/filter/components/popularityWidget.dart';
import 'package:postin_app/components/filter/components/searchRangeWidget.dart';
import 'package:postin_app/components/filter/components/rangeDatesWidget.dart';

class EventsFilterPage extends StatefulWidget {
  @override
  _EventsFilterPageState createState() => _EventsFilterPageState();
}

class _EventsFilterPageState extends State<EventsFilterPage> {
  // Variables to store filter states
  bool _freePrice = false;
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
                _freePrice = false;
                _isPopularSelected = false;
                _priceRange = RangeValues(0, 10000);
                _searchRange = 100;
                _rangeDates = RangeValues(
                  DateTime.now().millisecondsSinceEpoch.toDouble(),
                  DateTime.utc(DateTime.now().year, DateTime.now().month + 1,
                          DateTime.now().day)
                      .millisecondsSinceEpoch
                      .toDouble(),
                );
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
              _freePrice,
              _priceRange,
              (RangeValues values) {
                setState(() {
                  _priceRange = values;
                });
              },
              (bool value) {
                setState(() {
                  _freePrice = value;
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
                  // Aplicar filtros y cerrar la página
                  Navigator.pop(context);
                },
                child: Text(
                  'Apply',
                  style: TextStyle(
                    color: Theme.of(context)
                        .primaryColor, // Color del texto ajustado
                  ),
                ), // Texto en español
              ),
            ),
          ],
        ),
      ),
    );
  }
}
