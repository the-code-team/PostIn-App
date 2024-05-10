import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Container(
          color: Colors.white, // Fondo blanco
          padding: EdgeInsets.symmetric(horizontal: 20),
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
              Card(
                margin: EdgeInsets.symmetric(vertical: 10),
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Row(
                        children: [
                          CircleAvatar(
                            radius: 40,
                            backgroundImage: AssetImage('assets/avatar.png'),
                          ),
                          SizedBox(width: 20),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'PATRICIA, 30',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                              Text(
                                'Interesad@ en: ',
                                style: TextStyle(
                                  fontSize: 17,
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
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
              ),
              //PARTE DE LA CONFIGURACION
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
                    buildListItem(
                        Icons.insert_page_break_outlined, 'Tu biografia'),
                    buildListItem(
                        Icons.security, 'Configuraciones de seguridad'),
                    buildListItem(
                        Icons.app_blocking_rounded, 'Usuarios bloqueados'),
                    buildListItem(Icons.logout, 'Cerrar sesion'),
                  ],
                ),
              ),
            ],
          ),
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
