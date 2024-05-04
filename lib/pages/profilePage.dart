import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Perfil',
        style: TextStyle(fontSize: 24.0),
    return Scaffold(
      appBar: AppBar(
        ///automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: EdgeInsets.all(20),
              child: Text(
                'PERFIL',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            //INFORMACION DE USUARIO
            Container(
              padding: EdgeInsets.all(20),
              margin: EdgeInsets.all(20),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                children: [
                  Row(children: [
                    CircleAvatar(
                      radius: 40,
                      backgroundImage: AssetImage('assets/avatar.png'),
                    ),
                    SizedBox(width: 20),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      //INFORMACION NOMBRE Y EDAD
                      children: [
                        Text(
                          'Usuario: Patri',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                        Text(
                          'Edad: 30',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    )
                  ]),
                  SizedBox(height: 20),
                  Wrap(
                    spacing: 10,
                    children: [
                      Chip(
                        label: Text('Interés 1'),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      Chip(
                        label: Text('Interés 2'),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      Chip(
                        label: Text('Interés 3'),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      Chip(
                        label: Text('Interés 4'),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
            //PARTE DE LA CONFIGUARACION
            Container(
              padding: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    'CONFIGURACION',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 5),
                  Divider(),
                  SizedBox(height: 5),
                  buildListItem(Icons.person, 'Informacion Personal'),
                  buildListItem(Icons.interests, 'Intereses'),
                  buildListItem(Icons.book, 'Tu biografia'),
                  buildListItem(Icons.security, 'Configuraciones de seguridad'),
                  buildListItem(
                      Icons.app_blocking_rounded, 'Usuarios bloqueados'),
                  buildListItem(Icons.logout, 'Cerrar sesion'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildListItem(IconData icon, String title) {
    return Column(
      children: [
        ListTile(
          leading: Icon(icon),
          title: Text(title),
        ),
        Divider(),
      ],
    );
  }
}
