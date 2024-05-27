import 'package:flutter/material.dart';
import 'package:postin_app/components/map/map.dart';

class MapPage extends StatefulWidget {
  const MapPage({Key? key});

  @override
  _MapPageState createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  int selectedIndex = 0; // State that stores the index of the selected item
  bool isEventListVisible =
      false; // State to control the visibility of EventListWidget

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
          children: [
            Expanded(
              child: MapComponent(),
            ),
          ],
        ),
        floatingActionButton: addEventFloatingActionButton(context));
  }
}

Widget addEventFloatingActionButton(BuildContext context) {
  return FloatingActionButton(
    onPressed: () => showAddEventDialog(context),
    backgroundColor: Theme.of(context).primaryColor,
    shape: const CircleBorder(),
    child: const Icon(Icons.add, color: Colors.white),
  );
}

void showAddEventDialog(BuildContext context) {
  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();

  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Agregar Evento'),
        content: SingleChildScrollView(
          child: Column(
            children: [
              TextField(
                controller: _titleController,
                decoration: InputDecoration(labelText: 'Título'),
              ),
              TextField(
                controller: _descriptionController,
                decoration: InputDecoration(labelText: 'Descripción'),
              ),
              ElevatedButton.icon(
                onPressed: () {
                  // Lógica para subir fotos
                },
                icon: Icon(Icons.photo),
                label: Text('Subir Fotos'),
              ),
            ],
          ),
        ),
        actions: <Widget>[
          TextButton(
            child: Text('Cancelar'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          ElevatedButton(
            child: Text('Guardar'),
            onPressed: () {
              // Lógica para guardar el evento
              // Por ejemplo, podrías recoger los valores de los controladores y almacenarlos en una base de datos o lista
              String title = _titleController.text;
              String description = _descriptionController.text;
              print('Título: $title, Descripción: $description');
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}
