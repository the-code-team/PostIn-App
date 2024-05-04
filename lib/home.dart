import 'package:flutter/material.dart';
import 'package:postin_app/pages/mapPage.dart';
import 'package:postin_app/pages/eventsPage.dart';
import 'package:postin_app/pages/profilePage.dart';
import 'package:postin_app/pages/groupsPage.dart';
import 'package:postin_app/pages/proposalsPage.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    super.key,
  });

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _paginaActual = 0;

  List<Widget> _paginas = [
    MapPage(),
    ProposalsPage(),
    EventsPage(),
    GroupsPage(),
    ProfilePage()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _paginas[_paginaActual],
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Theme.of(context).primaryColor,
        unselectedItemColor: Theme.of(context).unselectedWidgetColor,
        showUnselectedLabels: true,
        currentIndex: _paginaActual,
        onTap: (index) {
          setState(() {
            _paginaActual = index;
          });
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.map), label: "Map"),
          BottomNavigationBarItem(
              icon: Icon(Icons.edit_location_alt_outlined), label: "Proposes"),
          BottomNavigationBarItem(icon: Icon(Icons.event), label: "Eventos"),
          BottomNavigationBarItem(
              icon: Icon(Icons.chat_bubble_outline), label: "Groups"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Perfil")
        ],
      ),
    );
  }
}
