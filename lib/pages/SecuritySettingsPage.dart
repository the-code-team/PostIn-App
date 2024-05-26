import 'package:flutter/material.dart';

class SecuritySettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Configuraciones de seguridad'),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Configuraciones básicas:',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
              Column(
                children: [
                  buildListItem(Icons.settings, 'Ajustes'),
                  buildListItem(Icons.lock, 'Cambiar contraseña'),
                  buildListItem(
                      Icons.verified_user, 'Verificación de dos pasos'),
                  buildListItem(Icons.account_circle, 'Tipo de cuenta'),
                  buildListItem(Icons.security, 'Seguridad'),
                  buildListItem(Icons.location_on, 'Ubicación'),
                  buildListItem(Icons.info, 'Información'),
                  buildListItem(Icons.help, 'Ayuda'),
                ],
              ),
              SizedBox(height: 20),
              Text(
                'Versión de la aplicación 1.0.0',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.grey,
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
          onTap: () {},
        ),
        Divider(),
      ],
    );
  }
}
