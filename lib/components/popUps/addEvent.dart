import 'dart:io';
import 'package:flutter/services.dart' show rootBundle;
import 'package:path_provider/path_provider.dart';
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

import 'package:postin_app/components/jsonComunicator/jsonIO.dart';

void showAddEventDialog(BuildContext context) {
  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();
  final ImagePicker _picker = ImagePicker();
  List<File> _images = [];
  LatLng? _selectedLocation;
  bool _isSaveButtonEnabled = false;
  String _titleError = '';
  String _descriptionError = '';
  String _imagesError = '';
  String _locationError = '';

  void updateSaveButtonState(StateSetter setState) {
    setState(() {
      _isSaveButtonEnabled = _titleController.text.isNotEmpty &&
          _descriptionController.text.isNotEmpty &&
          _images.isNotEmpty &&
          _selectedLocation != null;
    });
  }

  void showMaxImageWarning(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Warning'),
          content: Text('Only up to 5 images can be selected.'),
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

  Future<void> _pickImage(ImageSource source, StateSetter setState) async {
    final pickedFile = await _picker.pickImage(source: source);
    if (pickedFile != null) {
      setState(() {
        _images.add(File(pickedFile.path));
        updateSaveButtonState(setState);
      });
    } else {
      print('No image selected.');
    }
  }

  void _showLocationPicker(BuildContext context, StateSetter setState) async {
    LatLng? location = await Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => LocationPickerPage(),
    ));
    if (location != null) {
      setState(() {
        _selectedLocation = location;
        updateSaveButtonState(setState);
      });
    }
  }

// Dentro de la función _validateAndSave, después de imprimir los detalles del evento
  void _validateAndSave(StateSetter setState) async {
    setState(() {
      _titleError = _titleController.text.isEmpty ? 'Title is required' : '';
      _descriptionError =
          _descriptionController.text.isEmpty ? 'Description is required' : '';
      _imagesError = _images.isEmpty ? 'At least one image is required' : '';
      _locationError = _selectedLocation == null ? 'Location is required' : '';
    });

    if (_isSaveButtonEnabled) {
      String title = _titleController.text;
      String description = _descriptionController.text;
      print(
          'Title: $title, Description: $description, Location: $_selectedLocation');

      // Leer el archivo JSON actual
      List<Map<String, dynamic>> events = await readEventsFile();
      print(">>>>> " + events.length.toString());

      // Agregar el nuevo evento
      events.add({
        "coordinates": {
          "latitude": _selectedLocation!.latitude,
          "longitude": _selectedLocation!.longitude
        },
        "identifier": "ID${events.length + 1}"
      });

      // Escribir la lista actualizada de eventos en el archivo JSON
      writeEventsFile(events);

      Navigator.of(context).pop();
    }
  }

  showDialog(
    context: context,
    builder: (BuildContext context) {
      return StatefulBuilder(
        builder: (BuildContext context, StateSetter setState) {
          return AlertDialog(
            title: Text('Add Event'),
            content: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: 10),
                  TextField(
                    controller: _titleController,
                    decoration: InputDecoration(
                      labelText: 'Title',
                      errorText: _titleError.isEmpty ? null : _titleError,
                    ),
                    onChanged: (text) => updateSaveButtonState(setState),
                  ),
                  TextField(
                    controller: _descriptionController,
                    decoration: InputDecoration(
                      labelText: 'Description',
                      errorText:
                          _descriptionError.isEmpty ? null : _descriptionError,
                    ),
                    onChanged: (text) => updateSaveButtonState(setState),
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(
                        width: 120,
                        height: 40,
                        child: ElevatedButton.icon(
                          onPressed: () {
                            if (_images.length < 5) {
                              _pickImage(ImageSource.gallery, setState);
                            } else {
                              showMaxImageWarning(context);
                            }
                          },
                          icon: Icon(
                            Icons.photo,
                            color: Theme.of(context).primaryColor,
                          ),
                          label: Text(
                            'Upload Photos',
                            style: TextStyle(
                              fontSize: 10,
                              color: Theme.of(context).primaryColor,
                            ),
                          ),
                          style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.all(10),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 120,
                        height: 40,
                        child: ElevatedButton.icon(
                          onPressed: () {
                            if (_images.length < 5) {
                              _pickImage(ImageSource.camera, setState);
                            } else {
                              showMaxImageWarning(context);
                            }
                          },
                          icon: Icon(
                            Icons.camera_alt,
                            color: Theme.of(context).primaryColor,
                          ),
                          label: Text(
                            'Take Photo',
                            style: TextStyle(
                              fontSize: 12,
                              color: Theme.of(context).primaryColor,
                            ),
                          ),
                          style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.all(10),
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
                      : Text(
                          'No photos selected',
                          style: TextStyle(
                            color: _imagesError.isEmpty
                                ? Colors.black
                                : Colors.red,
                          ),
                        ),
                  SizedBox(
                    width: 120,
                    height: 40,
                    child: ElevatedButton.icon(
                      onPressed: () {
                        _showLocationPicker(context, setState);
                      },
                      icon: Icon(
                        Icons.map,
                        color: Theme.of(context).primaryColor,
                      ),
                      label: Text(
                        'Select Location',
                        style: TextStyle(
                          fontSize: 12,
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.all(10),
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    _selectedLocation != null
                        ? 'Location: \n${_selectedLocation!.latitude}, ${_selectedLocation!.longitude}'
                        : 'No location selected',
                    style: TextStyle(
                      color: _locationError.isEmpty ? Colors.black : Colors.red,
                    ),
                  ),
                  SizedBox(height: 10),
                ],
              ),
            ),
            actions: <Widget>[
              TextButton(
                child: Text(
                  'Cancel',
                  style: TextStyle(
                    color: Theme.of(context).primaryColor,
                  ),
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              ElevatedButton(
                child: Text(
                  'Save',
                  style: TextStyle(
                    color: Theme.of(context).primaryColor,
                  ),
                ),
                onPressed: () {
                  _validateAndSave(setState);
                },
              ),
            ],
          );
        },
      );
    },
  );
}

class LocationPickerPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Select Location'),
      ),
      body: FlutterMap(
        options: MapOptions(
          center: LatLng(38.699575, -0.474774),
          zoom: 11.0,
          onTap: (tapPosition, point) {
            Navigator.of(context).pop(point);
          },
        ),
        children: [
          TileLayer(
            urlTemplate: "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
            subdomains: ['a', 'b', 'c'],
          ),
        ],
      ),
    );
  }
}
