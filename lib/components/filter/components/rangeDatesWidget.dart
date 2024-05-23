import 'package:flutter/material.dart';

Widget rangeDates(
  BuildContext context,
  RangeValues _rangeDates,
  Function(RangeValues) onDateChanged,
) {
  // Convertimos las fechas en formato legible
  String _formattedDate(DateTime date) {
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
            firstDate: DateTime.now(),
            lastDate: DateTime.now().add(Duration(days: 365 * 100)),
            initialDateRange: DateTimeRange(
              start: DateTime.now(),
              end: DateTime.now().add(Duration(days: 31)),
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
                  '    ${_formattedDate(DateTime.fromMillisecondsSinceEpoch(_rangeDates.start.toInt()))} - ${_formattedDate(DateTime.fromMillisecondsSinceEpoch(_rangeDates.end.toInt()))}',
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
