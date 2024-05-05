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
                buildListEvent(Icons.home, "Inicio", context),
                buildListEvent(Icons.work, "Trabajo", context),
                buildListEvent(Icons.school, "Escuela", context),
                buildListEvent(Icons.home, "Inicio", context),
                buildListEvent(Icons.work, "Trabajo", context),
                buildListEvent(Icons.school, "Escuela", context),
                buildListEvent(Icons.home, "Inicio", context),
                buildListEvent(Icons.work, "Trabajo", context),
                buildListEvent(Icons.school, "Escuela", context),
                // Agrega más elementos según necesites
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

  Widget buildListEvent(IconData icon, String text, BuildContext context) {
    final Color primaryColor = Theme.of(context).primaryColor;
    return GestureDetector(
      onTap: () {
        // Acción a realizar cuando se presione el elemento de la lista
      },
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: 8), // Espaciado horizontal entre elementos
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 50, color: primaryColor), // Icono
            SizedBox(height: 8), // Espacio entre el icono y el texto
            Text(
              text,
              style: TextStyle(fontSize: 16), // Tamaño de fuente del texto
            ), // Texto debajo del icono
          ],
        ),
      ),
    );
  }
}
