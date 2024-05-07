import 'package:flutter/material.dart';
import 'package:postin_app/pages/chatPage.dart';

class GroupsPage extends StatelessWidget {
  final List<Map<String, dynamic>> groups = [
    {
      'name': 'Grupo 1',
      'lastMessage': 'Joui: ¡Hola!',
      'time': '25 de abril, 22:04'
    },
    {
      'name': 'Grupo 2',
      'lastMessage': 'Marcos: ¿Unas cerves?',
      'time': '24 de abril, 15:32'
    }
    // Puedes añadir más grupos aquí
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Grupos'),
      ),
      body: ListView.builder(
        itemCount: groups.length,
        itemBuilder: (context, index) {
          var group = groups[index];
          return InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ChatPage(groupName: group['name']),
                ),
              );
            },
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.blueAccent,
                child: Text(group['name'][0]),
              ),
              title: Text(group['name']),
              subtitle: Text('${group['lastMessage']} - ${group['time']}'),
              trailing: Icon(Icons.chevron_right),
            ),
          );
        },
      ),
    );
  }
}
