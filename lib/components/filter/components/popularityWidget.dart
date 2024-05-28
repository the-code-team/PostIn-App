import 'package:flutter/material.dart';

Widget popularity(bool _isPopularSelected, Function(bool) onChanged) {
  // Variable para almacenar la opción seleccionada
  int _selectedOption = 0;

  return StatefulBuilder(
    builder: (BuildContext context, StateSetter setState) {
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
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            _selectedOption = 0;
                          });
                        },
                        child: Column(
                          children: [
                            Icon(
                              Icons.person,
                              size: 30,
                              color: _selectedOption == 0
                                  ? Theme.of(context).primaryColor
                                  : Theme.of(context).unselectedWidgetColor,
                            ),
                            Text(
                              '2-5',
                              style: TextStyle(
                                color: _selectedOption == 0
                                    ? Theme.of(context).primaryColor
                                    : Theme.of(context).unselectedWidgetColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            _selectedOption = 1;
                          });
                        },
                        child: Column(
                          children: [
                            Icon(
                              Icons.person,
                              size: 30,
                              color: _selectedOption == 1
                                  ? Theme.of(context).primaryColor
                                  : Theme.of(context).unselectedWidgetColor,
                            ),
                            Text(
                              '5-10',
                              style: TextStyle(
                                color: _selectedOption == 1
                                    ? Theme.of(context).primaryColor
                                    : Theme.of(context).unselectedWidgetColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            _selectedOption = 2;
                          });
                        },
                        child: Column(
                          children: [
                            Icon(
                              Icons.person,
                              size: 30,
                              color: _selectedOption == 2
                                  ? Theme.of(context).primaryColor
                                  : Theme.of(context).unselectedWidgetColor,
                            ),
                            Text(
                              '10-25',
                              style: TextStyle(
                                color: _selectedOption == 2
                                    ? Theme.of(context).primaryColor
                                    : Theme.of(context).unselectedWidgetColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            _selectedOption = 3;
                          });
                        },
                        child: Column(
                          children: [
                            Icon(
                              Icons.person,
                              size: 30,
                              color: _selectedOption == 3
                                  ? Theme.of(context).primaryColor
                                  : Theme.of(context).unselectedWidgetColor,
                            ),
                            Text(
                              '25-50',
                              style: TextStyle(
                                color: _selectedOption == 3
                                    ? Theme.of(context).primaryColor
                                    : Theme.of(context).unselectedWidgetColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            _selectedOption = 4;
                          });
                        },
                        child: Column(
                          children: [
                            Icon(
                              Icons.person,
                              size: 30,
                              color: _selectedOption == 4
                                  ? Theme.of(context).primaryColor
                                  : Theme.of(context).unselectedWidgetColor,
                            ),
                            Text(
                              '50-100',
                              style: TextStyle(
                                color: _selectedOption == 4
                                    ? Theme.of(context).primaryColor
                                    : Theme.of(context).unselectedWidgetColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
        ],
      );
    },
  );
}
