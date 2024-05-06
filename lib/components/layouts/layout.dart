import 'package:flutter/material.dart';
import 'package:postin_app/pages/mapPage.dart';
import 'package:postin_app/pages/eventsPage.dart';
import 'package:postin_app/pages/profilePage.dart';
import 'package:postin_app/pages/groupsPage.dart';
import 'package:postin_app/pages/proposalsPage.dart';

class Layout extends StatefulWidget {
  const Layout({
    super.key,
  });

  @override
  State<Layout> createState() => _LayoutState();
}

class _LayoutState extends State<Layout> {
  int _actualPage = 0;

  List<Widget> _pages = [
    MapPage(),
    ProposalsPage(),
    EventsPage(),
    GroupsPage(),
    ProfilePage()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_actualPage],
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Theme.of(context).primaryColor,
        unselectedItemColor: Theme.of(context).unselectedWidgetColor,
        showUnselectedLabels: true,
        currentIndex: _actualPage,
        onTap: (index) {
          setState(() {
            _actualPage = index;
          });
        },
        items: const [
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
