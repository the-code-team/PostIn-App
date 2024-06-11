import 'dart:io';
import 'package:flutter/services.dart' show rootBundle;
import 'package:path_provider/path_provider.dart';
import 'dart:convert';

Future<List<Map<String, dynamic>>> readEventsFileAssets() async {
  final directory = await getApplicationDocumentsDirectory();
  // final filePath = '${directory.path}/location_events.json';
  final filePath = 'assets/location_events.json';

  final String jsonString = await rootBundle.loadString(filePath);
  final List<dynamic> jsonData = json.decode(jsonString);
  return List<Map<String, dynamic>>.from(jsonData);
}

// Future<List<Map<String, dynamic>>> readEventsFile() async {
//   final directory = await getApplicationDocumentsDirectory();
//   final filePath = '${directory.path}/location_events.json';

//   final String jsonString = await rootBundle.loadString(filePath);
//   final List<dynamic> jsonData = json.decode(jsonString);
//   return List<Map<String, dynamic>>.from(jsonData);
// }

Future<List<Map<String, dynamic>>> readEventsFile() async {
  try {
    // Obtener el directorio de documentos
    final directory = await getApplicationDocumentsDirectory();
    final filePath = '${directory.path}/location_events.json';
    final file = File(filePath);

    // Verificar si el archivo existe
    if (await file.exists()) {
      // Leer el contenido del archivo JSON desde el sistema de archivos
      final jsonString = await file.readAsString();
      print(jsonString);
      final List<dynamic> jsonMap = json.decode(jsonString) as List<dynamic>;

      // Convertir la lista dinámica a una lista de mapas
      final List<Map<String, dynamic>> events =
          jsonMap.map((e) => e as Map<String, dynamic>).toList();

      print('Archivo leído exitosamente.');
      return events;
    } else {
      // Si el archivo no existe, retornar una lista vacía
      print('El archivo no existe.');
      return [];
    }
  } catch (e) {
    print('Error al leer el archivo: $e');
    return [];
  }
}

Future<void> writeEventsFile(List<Map<String, dynamic>> events) async {
  try {
    // Obtener el directorio de documentos
    final directory = await getApplicationDocumentsDirectory();
    final filePath = '${directory.path}/location_events.json';
    final file = File(filePath);

    List<dynamic> jsonMap = [];

    // Agregar los nuevos eventos al archivo existente
    jsonMap.addAll(events);

    // Escribir el archivo JSON actualizado en el sistema de archivos
    await file.writeAsString(json.encode(jsonMap));

    print('Archivo creado o actualizado exitosamente.');
  } catch (e) {
    print('Error al crear o actualizar el archivo: $e');
  }
}

// Dentro de la función _validateAndSave, después de imprimir los detalles del evento
void saveInMemory() async {
  // Leer el archivo JSON actual
  List<Map<String, dynamic>> events = await readEventsFileAssets();
  print(">>>>> " + events.length.toString());

  // Escribir la lista actualizada de eventos en el archivo JSON
  writeEventsFile(events);
}
