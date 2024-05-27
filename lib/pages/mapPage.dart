import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

import 'package:postin_app/components/map/map.dart';

class MapPage extends StatefulWidget {
  const MapPage({Key? key});

  @override
  _MapPageState createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  int selectedIndex =
      0; // Estado que almacena el índice del elemento seleccionado
  bool isEventListVisible =
      false; // Estado para controlar la visibilidad de EventListWidget

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
      floatingActionButton: addEventFloatingActionButton(context),
    );
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
  final ImagePicker _picker = ImagePicker();
  List<File> _images = [];

  showDialog(
    context: context,
    builder: (BuildContext context) {
      return StatefulBuilder(
        builder: (BuildContext context, StateSetter setState) {
          Future<void> _pickImage() async {
            final pickedFile =
                await _picker.pickImage(source: ImageSource.gallery);
            if (pickedFile != null) {
              setState(() {
                _images.add(File(pickedFile.path));
              });
            }
          }

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
                    onPressed: _pickImage,
                    icon: Icon(Icons.photo),
                    label: Text('Subir Fotos'),
                  ),
                  SizedBox(height: 10),
                  _images.isNotEmpty
                      ? Wrap(
                          spacing: 8.0,
                          runSpacing: 8.0,
                          children: _images.map((image) {
                            return Image.file(
                              image,
                              width: 100,
                              height: 100,
                              fit: BoxFit.cover,
                            );
                          }).toList(),
                        )
                      : Text('No se han seleccionado fotos'),
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
                  String title = _titleController.text;
                  String description = _descriptionController.text;
                  print('Título: $title, Descripción: $description');
                  // Aquí puedes manejar las imágenes (_images) como necesites
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    },
  );
}
