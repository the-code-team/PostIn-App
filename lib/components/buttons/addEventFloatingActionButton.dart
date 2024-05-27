import 'package:flutter/material.dart';
import 'package:postin_app/components/popUps/addEvent.dart';

Widget addEventFloatingActionButton(BuildContext context) {
  return FloatingActionButton(
    onPressed: () => showAddEventDialog(context),
    backgroundColor: Theme.of(context).primaryColor,
    shape: const CircleBorder(),
    child: const Icon(Icons.add, color: Colors.white),
  );
}
