import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
<<<<<<< Updated upstream
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
=======
>>>>>>> Stashed changes

void showAddEventDialog(BuildContext context) {
  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();
  final ImagePicker _picker = ImagePicker();
  List<File> _images = [];
<<<<<<< Updated upstream
  LatLng? _selectedLocation;
=======
>>>>>>> Stashed changes

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

<<<<<<< Updated upstream
  Future<void> _pickImage(ImageSource source, StateSetter setState) async {
    final pickedFile = await _picker.pickImage(source: source);
    if (pickedFile != null) {
      setState(() {
        _images.add(File(pickedFile.path));
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
      });
    }
  }

=======
>>>>>>> Stashed changes
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return StatefulBuilder(
        builder: (BuildContext context, StateSetter setState) {
<<<<<<< Updated upstream
=======
          Future<void> _pickImage(ImageSource source) async {
            final pickedFile = await _picker.pickImage(source: source);
            if (pickedFile != null) {
              setState(() {
                _images.add(File(pickedFile.path));
              });
            } else {
              print('No image selected.');
            }
          }

>>>>>>> Stashed changes
          return AlertDialog(
            title: Text('Add Event'),
            content: SingleChildScrollView(
              child: Column(
                children: [
<<<<<<< Updated upstream
                  SizedBox(height: 10),
=======
                  SizedBox(height: 10), // Space between TextField and Row
>>>>>>> Stashed changes
                  TextField(
                    controller: _titleController,
                    decoration: InputDecoration(labelText: 'Title'),
                  ),
                  TextField(
                    controller: _descriptionController,
                    decoration: InputDecoration(labelText: 'Description'),
                  ),
<<<<<<< Updated upstream
                  SizedBox(height: 10),
=======
                  SizedBox(height: 10), // Space between TextField and Row
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
<<<<<<< Updated upstream
                              _pickImage(ImageSource.gallery, setState);
=======
                              _pickImage(ImageSource.gallery);
>>>>>>> Stashed changes
                            } else {
                              showMaxImageWarning(context);
                            }
                          },
                          icon: Icon(
                            Icons.photo,
<<<<<<< Updated upstream
                            color: Theme.of(context).primaryColor,
=======
                            color: Theme.of(context)
                                .primaryColor, // Primary color of the app
>>>>>>> Stashed changes
                          ),
                          label: Text(
                            'Upload Photos',
                            style: TextStyle(
                              fontSize: 10,
<<<<<<< Updated upstream
                              color: Theme.of(context).primaryColor,
                            ),
                          ),
                          style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.all(10),
=======
                              color: Theme.of(context)
                                  .primaryColor, // Primary color of the app
                            ),
                          ),
                          style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.all(10), // Adjust padding
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
<<<<<<< Updated upstream
                              _pickImage(ImageSource.camera, setState);
=======
                              _pickImage(ImageSource.camera);
>>>>>>> Stashed changes
                            } else {
                              showMaxImageWarning(context);
                            }
                          },
                          icon: Icon(
                            Icons.camera_alt,
<<<<<<< Updated upstream
                            color: Theme.of(context).primaryColor,
=======
                            color: Theme.of(context)
                                .primaryColor, // Primary color of the app
>>>>>>> Stashed changes
                          ),
                          label: Text(
                            'Take Photo',
                            style: TextStyle(
                              fontSize: 12,
<<<<<<< Updated upstream
                              color: Theme.of(context).primaryColor,
                            ),
                          ),
                          style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.all(10),
=======
                              color: Theme.of(context)
                                  .primaryColor, // Primary color of the app
                            ),
                          ),
                          style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.all(10), // Adjust padding
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
                      : Text('No photos selected'),
<<<<<<< Updated upstream
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
                  _selectedLocation != null
                      ? Text(
                          'Location: \n${_selectedLocation!.latitude}, ${_selectedLocation!.longitude}')
                      : Text('No location selected'),
                  SizedBox(height: 10),
=======
>>>>>>> Stashed changes
                ],
              ),
            ),
            actions: <Widget>[
              TextButton(
                child: Text(
                  'Cancel',
                  style: TextStyle(
<<<<<<< Updated upstream
                    color: Theme.of(context).primaryColor,
=======
                    color: Theme.of(context)
                        .primaryColor, // Primary color of the app
>>>>>>> Stashed changes
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
<<<<<<< Updated upstream
                    color: Theme.of(context).primaryColor,
=======
                    color: Theme.of(context)
                        .primaryColor, // Primary color of the app
>>>>>>> Stashed changes
                  ),
                ),
                onPressed: () {
                  // Logic to save the event
                  String title = _titleController.text;
                  String description = _descriptionController.text;
<<<<<<< Updated upstream
                  print(
                      'Title: $title, Description: $description, Location: $_selectedLocation');
=======
                  print('Title: $title, Description: $description');
                  // Here you can handle the images (_images) as needed
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
<<<<<<< Updated upstream

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
=======
>>>>>>> Stashed changes
