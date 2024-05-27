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

  void showMaxImageWarning(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Advertencia'),
          content: Text('Solo se permiten seleccionar hasta 5 imágenes.'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }

  showDialog(
    context: context,
    builder: (BuildContext context) {
      return StatefulBuilder(
        builder: (BuildContext context, StateSetter setState) {
          Future<void> _pickImage(ImageSource source) async {
            final pickedFile = await _picker.pickImage(source: source);
            if (pickedFile != null) {
              setState(() {
                _images.add(File(pickedFile.path));
              });
            } else {
              print('No se seleccionó ninguna imagen.');
            }
          }

          return AlertDialog(
            title: Text('Agregar Evento'),
            content: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: 10), // Espacio entre TextField y Row
                  TextField(
                    controller: _titleController,
                    decoration: InputDecoration(labelText: 'Título'),
                  ),
                  TextField(
                    controller: _descriptionController,
                    decoration: InputDecoration(labelText: 'Descripción'),
                  ),
                  SizedBox(height: 10), // Espacio entre TextField y Row
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(
                        width: 120,
                        height: 40,
                        child: ElevatedButton.icon(
                          onPressed: () {
                            if (_images.length < 5) {
                              _pickImage(ImageSource.gallery);
                            } else {
                              showMaxImageWarning(context);
                            }
                          },
                          icon: Icon(
                            Icons.photo,
                            color: Theme.of(context)
                                .primaryColor, // Color principal de la aplicación
                          ),
                          label: Text(
                            'Subir Fotos',
                            style: TextStyle(
                              fontSize: 12,
                              color: Theme.of(context)
                                  .primaryColor, // Color principal de la aplicación
                            ),
                          ),
                          style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.all(10), // Ajusta el padding
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 120,
                        height: 40,
                        child: ElevatedButton.icon(
                          onPressed: () {
                            if (_images.length < 5) {
                              _pickImage(ImageSource.camera);
                            } else {
                              showMaxImageWarning(context);
                            }
                          },
                          icon: Icon(
                            Icons.camera_alt,
                            color: Theme.of(context)
                                .primaryColor, // Color principal de la aplicación
                          ),
                          label: Text(
                            'Tomar Foto',
                            style: TextStyle(
                              fontSize: 12,
                              color: Theme.of(context)
                                  .primaryColor, // Color principal de la aplicación
                            ),
                          ),
                          style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.all(10), // Ajusta el padding
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  _images.isNotEmpty
                      ? SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: _images.map((image) {
                              return Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Image.file(
                                  image,
                                  width: 100,
                                  height: 100,
                                  fit: BoxFit.cover,
                                ),
                              );
                            }).toList(),
                          ),
                        )
                      : Text('No se han seleccionado fotos'),
                ],
              ),
            ),
            actions: <Widget>[
              TextButton(
                child: Text(
                  'Cancelar',
                  style: TextStyle(
                    color: Theme.of(context)
                        .primaryColor, // Color principal de la aplicación
                  ),
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              ElevatedButton(
                child: Text(
                  'Guardar',
                  style: TextStyle(
                    color: Theme.of(context)
                        .primaryColor, // Color principal de la aplicación
                  ),
                ),
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
