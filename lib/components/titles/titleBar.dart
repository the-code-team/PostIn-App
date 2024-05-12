import 'package:flutter/material.dart';

Widget buildTitleBar(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.fromLTRB(16, 40, 16, 15),
    child: ElevatedButton(
      onPressed: () {
        // Acción
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            "Post-In",
            style: TextStyle(
              fontSize: 18,
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
