import 'package:flutter/material.dart';
import 'package:postin_app/components/filter/filterPage.dart'; // Importa la página EventsFilter

Widget buildTitleBar(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.fromLTRB(16, 40, 16, 15),
    child: ElevatedButton(
      onPressed: () {
        // Navegar a la página EventsFilter al pulsar el botón
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => EventsFilterPage()),
        );
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Post-In",
            style: TextStyle(
              fontSize: 18,
              color: Theme.of(context).primaryColor,
            ),
          ),
          Icon(
            Icons.filter_list_outlined,
            color: Theme.of(context).primaryColor,
          ),
        ],
      ),
    ),
  );
}
