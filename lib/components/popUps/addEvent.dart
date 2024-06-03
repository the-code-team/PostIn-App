import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

<<<<<<< Updated upstream
=======

>>>>>>> Stashed changes
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
<<<<<<< Updated upstream
          title: Text('Warning'),
          content: Text('Only up to 5 images can be selected.'),
=======
          title: Text('Advertencia'),
          content: Text('Solo se permiten seleccionar hasta 5 imágenes.'),
>>>>>>> Stashed changes
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
<<<<<<< Updated upstream
              print('No image selected.');
=======
              print('No se seleccionó ninguna imagen.');
>>>>>>> Stashed changes
            }
          }

          return AlertDialog(
<<<<<<< Updated upstream
            title: Text('Add Event'),
            content: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: 10), // Space between TextField and Row
                  TextField(
                    controller: _titleController,
                    decoration: InputDecoration(labelText: 'Title'),
                  ),
                  TextField(
                    controller: _descriptionController,
                    decoration: InputDecoration(labelText: 'Description'),
                  ),
                  SizedBox(height: 10), // Space between TextField and Row
=======
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
>>>>>>> Stashed changes
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
<<<<<<< Updated upstream
                                .primaryColor, // Primary color of the app
                          ),
                          label: Text(
                            'Upload Photos',
                            style: TextStyle(
                              fontSize: 10,
                              color: Theme.of(context)
                                  .primaryColor, // Primary color of the app
                            ),
                          ),
                          style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.all(10), // Adjust padding
=======
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
>>>>>>> Stashed changes
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
<<<<<<< Updated upstream
                                .primaryColor, // Primary color of the app
                          ),
                          label: Text(
                            'Take Photo',
                            style: TextStyle(
                              fontSize: 12,
                              color: Theme.of(context)
                                  .primaryColor, // Primary color of the app
                            ),
                          ),
                          style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.all(10), // Adjust padding
=======
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
>>>>>>> Stashed changes
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
<<<<<<< Updated upstream
                      : Text('No photos selected'),
=======
                      : Text('No se han seleccionado fotos'),
>>>>>>> Stashed changes
                ],
              ),
            ),
            actions: <Widget>[
              TextButton(
                child: Text(
<<<<<<< Updated upstream
                  'Cancel',
                  style: TextStyle(
                    color: Theme.of(context)
                        .primaryColor, // Primary color of the app
=======
                  'Cancelar',
                  style: TextStyle(
                    color: Theme.of(context)
                        .primaryColor, // Color principal de la aplicación
>>>>>>> Stashed changes
                  ),
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              ElevatedButton(
                child: Text(
<<<<<<< Updated upstream
                  'Save',
                  style: TextStyle(
                    color: Theme.of(context)
                        .primaryColor, // Primary color of the app
                  ),
                ),
                onPressed: () {
                  // Logic to save the event
                  String title = _titleController.text;
                  String description = _descriptionController.text;
                  print('Title: $title, Description: $description');
                  // Here you can handle the images (_images) as needed
=======
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
>>>>>>> Stashed changes
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
