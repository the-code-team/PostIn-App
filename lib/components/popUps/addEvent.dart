import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

void showAddEventDialog(BuildContext context) {
  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();
  final ImagePicker _picker = ImagePicker();
  List<File> _images = [];
  LatLng? _selectedLocation;

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

  Future<void> _pickImage(ImageSource source) async {
    final pickedFile = await _picker.pickImage(source: source);
    if (pickedFile != null) {
      _images.add(File(pickedFile.path));
    } else {
      print('No image selected.');
    }
  }

  void _showLocationPicker(BuildContext context) async {
    LatLng? location = await Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => LocationPickerPage(),
    ));
    if (location != null) {
      _selectedLocation = location;
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
                    decoration: InputDecoration(labelText: 'Title'),
                  ),
                  TextField(
                    controller: _descriptionController,
                    decoration: InputDecoration(labelText: 'Description'),
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
                              setState(() {
                                _pickImage(ImageSource.gallery);
                              });
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
                              setState(() {
                                _pickImage(ImageSource.camera);
                              });
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
                      : Text('No photos selected'),
                  SizedBox(
                    width: 120,
                    height: 40,
                    child: ElevatedButton.icon(
                      onPressed: () {
                        _showLocationPicker(context);
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
                  _selectedLocation != null
                      ? Text(
                          'Location: \n${_selectedLocation!.latitude}, ${_selectedLocation!.longitude}')
                      : Text('No location selected'),
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
                  // Logic to save the event
                  String title = _titleController.text;
                  String description = _descriptionController.text;
                  print(
                      'Title: $title, Description: $description, Location: $_selectedLocation');
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
