import 'dart:convert';
import 'dart:io';

Future<void> main() async {
  // Leer JSON desde un archivo
  await leerJson();

  // Crear un Map para escribir en el archivo
  final datos = {
    'nombre': 'Juan',
    'edad': 30,
    'ciudad': 'Madrid'
  };

  // Escribir JSON en el archivo
  await escribirJson(datos);
}

Future<void> leerJson() async {
  final archivo = File('../data/archivo.json');
  final contenido = await archivo.readAsString();
  final datos = jsonDecode(contenido);
  print('Contenido del archivo JSON: $datos');
}

Future<void> escribirJson(Map<String, dynamic> datos) async {
  final archivo = File('../data/archivo.json');
  final contenido = jsonEncode(datos);
  await archivo.writeAsString(contenido);
  print('Datos escritos en el archivo JSON.');
}
