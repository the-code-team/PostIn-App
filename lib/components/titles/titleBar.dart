import 'package:flutter/material.dart';

Widget buildTitleBar(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.fromLTRB(16, 35, 16, 15),
    child: Container(
      padding: EdgeInsets.fromLTRB(25, 2, 5, 2),
      width: double.infinity,
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 225, 225, 225),
        border: Border.all(
          color: Theme.of(context).primaryColor,
          width: 1,
        ),
        borderRadius: BorderRadius.circular(40),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Post-In",
            style: TextStyle(
              fontSize: 18,
            ),
          ),
          TextButton(
            onPressed: () {
              // Acción a realizar al presionar el botón
            },
            child: Icon(
              Icons.filter_list_outlined,
              color: Theme.of(context).primaryColor,
            ),
          ),
        ],
      ),
    ),
  );
}
