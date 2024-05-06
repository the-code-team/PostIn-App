import 'package:flutter/material.dart';

Widget buildTitleBar(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.fromLTRB(16, 35, 16, 15),
    child: Container(
      padding: EdgeInsets.fromLTRB(25, 12, 16, 12),
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
          Icon(
            Icons.filter_list_outlined,
            color: Theme.of(context).primaryColor,
          ),
        ],
      ),
    ),
  );
}
