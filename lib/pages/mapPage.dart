import 'package:flutter/material.dart';
import 'package:postin_app/components/search_bar/searchBar.dart';
import 'package:postin_app/components/map/map.dart';

class MapPage extends StatelessWidget {
  const MapPage({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          buildSearchField(context),
          SizedBox(
            height: 100, // Altura deseada para la lista de elementos
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                buildListItem(Icons.home, "Inicio"),
                buildListItem(Icons.work, "Trabajo"),
                buildListItem(Icons.school, "Escuela"),
                buildListItem(Icons.home, "Inicio"),
                buildListItem(Icons.work, "Trabajo"),
                buildListItem(Icons.school, "Escuela"),
                buildListItem(Icons.home, "Inicio"),
                buildListItem(Icons.work, "Trabajo"),
                buildListItem(Icons.school,
                    "Escuela"), // Agrega más elementos según necesites
              ],
            ),
          ),
          Expanded(
            child: MapComponent(),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {},
        backgroundColor: Theme.of(context).primaryColor,
        shape: const CircleBorder(),
        child: const Icon(Icons.add, color: Colors.white),
      ),
    );
  }

  Widget buildListItem(IconData icon, String text) {
    return Container(
      width: 100, // Ancho deseado para cada elemento
      margin: EdgeInsets.all(8), // Margen entre los elementos
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 50, // Ancho deseado para el icono
            height: 50, // Altura deseada para el icono
            decoration: BoxDecoration(
              color: Colors.blue, // Color de fondo del botón
              borderRadius: BorderRadius.circular(10), // Bordes redondeados
            ),
            child: Icon(icon, color: Colors.white), // Icono
          ),
          SizedBox(height: 8), // Espacio entre el icono y el texto
          Text(text), // Texto debajo del icono
        ],
      ),
    );
  }
}
