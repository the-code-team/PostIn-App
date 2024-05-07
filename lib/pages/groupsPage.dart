import 'package:flutter/material.dart';
import 'package:postin_app/pages/chatPage.dart';

class GroupsPage extends StatelessWidget {
  //Son grupos de ejemplo dolamente
  final List<Map<String, dynamic>> groups = [
    {
      'name': 'Group 1',
      'lastMessage': 'Joui: ¡Hello!',
      'time': '25 of april, 22:04'
    },
    {
      'name': 'Group 2',
      'lastMessage': 'Marcos: ¿Do you want go to the café?',
      'time': '24 of april, 15:32'
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //Titulo de la página
        title: Text('Groups'),
      ),
      body: ListView.builder(
        //Lista donde salen los grupos
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
              //Icono del grupo
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
