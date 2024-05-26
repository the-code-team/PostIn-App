import 'package:flutter/material.dart';

// Lista global de usuarios bloqueados (por ejemplo)
List<Map<String, String>> blockedUsers = [
  {'name': 'Usuario 1', 'image': 'assets/avatar.png'},
  {'name': 'Usuario 2', 'image': 'assets/avatar.png'},
  {'name': 'Usuario 3', 'image': 'assets/avatar.png'},
  {'name': 'Usuario 4', 'image': 'assets/avatar.png'},
  {'name': 'Usuario 5', 'image': 'assets/avatar.png'},
  {'name': 'Usuario 6', 'image': 'assets/avatar.png'},
  {'name': 'Usuario 7', 'image': 'assets/avatar.png'},
  {'name': 'Usuario 8', 'image': 'assets/avatar.png'},
  {'name': 'Usuario 9', 'image': 'assets/avatar.png'},
  {'name': 'Usuario 10', 'image': 'assets/avatar.png'},
];

class BlockedUsersPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Usuarios Bloqueados'),
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        child: ListView.builder(
          itemCount: blockedUsers.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: ListTile(
                leading: CircleAvatar(
                  radius: 40, // Aumenta el tamaño del círculo
                  backgroundImage: AssetImage(blockedUsers[index]['image']!),
                ),
                title: Text(
                  blockedUsers[index]['name']!,
                  style: TextStyle(
                    fontSize: 20, // Aumenta el tamaño del texto
                    fontWeight: FontWeight.bold,
                  ),
                ),
                contentPadding: EdgeInsets.symmetric(horizontal: 20),
              ),
            );
          },
        ),
      ),
    );
  }
}
