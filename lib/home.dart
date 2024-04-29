import 'package:flutter/material.dart';
import 'package:postin_app/pages/mapPage.dart';
import 'package:postin_app/pages/eventsPage.dart';
import 'package:postin_app/pages/profilePage.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _paginaActual = 0;

  List<Widget> _paginas = [MapPage(), EventsPage(), ProfilePage()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: _paginas[_paginaActual],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _paginaActual,
        onTap: (index) {
          setState(() {
            _paginaActual = index;
          });
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.map), label: "Map"),
          BottomNavigationBarItem(icon: Icon(Icons.event), label: "Eventos"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Perfil")
        ],
      ),
    );
  }
}
