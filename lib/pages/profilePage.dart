import 'package:flutter/material.dart';
import 'ConfigurationPage.dart';
import 'PersonalInfoPage.dart';
import 'BlockedUsersPage.dart';
import 'InterestsPage.dart';
import 'SecuritySettingsPage.dart';
import 'LogoutPage.dart';

String userName = 'PATRICIA';
int userAge = 30;
String userImage = 'assets/avatar.png';
List<String> userInterests = ['Deporte', 'Fiesta', 'UPV', 'Alcoy'];

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Container(
          color: Colors.white,
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
                            backgroundImage: AssetImage(userImage),
                          ),
                          SizedBox(width: 20),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '$userName, $userAge',
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
                        children: userInterests.map((interest) {
                          return Chip(
                            label: Text(interest),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          );
                        }).toList(),
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
                    buildListItem(
                        Icons.person, 'Informacion Personal', context),
                    buildListItem(Icons.interests, 'Intereses', context),
                    buildListItem(Icons.description, 'Tu biografía', context),
                    buildListItem(Icons.security,
                        'Configuraciones de seguridad', context),
                    buildListItem(Icons.app_blocking_rounded,
                        'Usuarios bloqueados', context),
                    buildListItem(Icons.logout, 'Cerrar sesion', context),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildListItem(IconData icon, String title, BuildContext context) {
    return Column(
      children: [
        ListTile(
          onTap: () => navigateToPage(context, title),
          leading: Icon(icon),
          title: Text(title),
        ),
        Divider(),
      ],
    );
  }

  void navigateToPage(BuildContext context, String title) {
    if (title == 'Informacion Personal') {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => PersonalInfoPage(
            image: userImage,
            userName: userName,
            age: userAge,
            interests: userInterests,
          ),
        ),
      );
    } else if (title == 'Intereses') {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => InterestsPage(
            interests: userInterests,
          ),
        ),
      );
    } else if (title == 'Usuarios bloqueados') {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => BlockedUsersPage(),
        ),
      );
    } else if (title == 'Configuraciones de seguridad') {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => SecuritySettingsPage(),
        ),
      );
    } else if (title == 'Cerrar sesion') {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => LogoutPage(),
        ),
      );
    } else {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ConfigurationPage(title: title),
        ),
      );
    }
  }
}
