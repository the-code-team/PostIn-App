import 'package:flutter/material.dart';
import 'package:postin_app/pages/chatPage.dart';

class GroupsPage extends StatelessWidget {
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
        title: Text('Groups'),
      ),
      body: ListView.builder(
        itemCount: groups.length,
        itemBuilder: (context, index) {
          var group = groups[index];
          return InkWell(
            onTap: () {
              Navigator.push(
                context,
                PageRouteBuilder(
                  pageBuilder: (context, animation, secondaryAnimation) {
                    return ChatPage(groupName: group['name']);
                  },
                  transitionsBuilder:
                      (context, animation, secondaryAnimation, child) {
                    const begin = Offset(1.0, 0.0);
                    const end = Offset.zero;
                    const curve = Curves.easeInOut;
                    var tween = Tween(begin: begin, end: end)
                        .chain(CurveTween(curve: curve));
                    var offsetAnimation = animation.drive(tween);
                    return SlideTransition(
                      position: offsetAnimation,
                      child: child,
                    );
                  },
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
