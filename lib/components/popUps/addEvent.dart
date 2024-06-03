import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

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
              print('No image selected.');
            }
          }

          return AlertDialog(
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
                ],
              ),
            ),
            actions: <Widget>[
              TextButton(
                child: Text(
                  'Cancel',
                  style: TextStyle(
                    color: Theme.of(context)
                        .primaryColor, // Primary color of the app
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
