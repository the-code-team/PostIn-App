import 'package:flutter/material.dart';
import 'package:postin_app/models/message.dart';
import 'package:postin_app/pages/chatPage.dart';

class GroupsPage extends StatefulWidget {
  @override
  _GroupsPageState createState() => _GroupsPageState();
}

class _GroupsPageState extends State<GroupsPage> {
  List<Map<String, dynamic>> groups = [
    {
      'name': 'Group 1',
      'lastMessage': 'Joui: Hello!',
      'time': '25 of April, 22:04',
      'isPinned': false,
    },
    {
      'name': 'Group 2',
      'lastMessage': 'Joui: Hello!',
      'time': '24 of April, 15:32',
      'isPinned': false,
    },
    // Añade más grupos aquí
  ];

  void _pinGroup(int index) {
    setState(() {
      final isPinned = groups[index]['isPinned'];
      groups[index]['isPinned'] = !isPinned;
      if (isPinned) {
        final group = groups.removeAt(index);
        groups.insert(0, group);
      } else {
        final group = groups.removeAt(index);
        groups.add(group);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    groups.sort((a, b) {
      int pinA = a['isPinned'] ? 1 : 0;
      int pinB = b['isPinned'] ? 1 : 0;
      return pinB.compareTo(pinA);
    });

    return Scaffold(
      appBar: AppBar(
        title: Text('Groups'),
      ),
      body: ListView.builder(
        itemCount: groups.length,
        itemBuilder: (context, index) {
          var group = groups[index];
          return InkWell(
            onLongPress: () => _pinGroup(index),
            onTap: () {
              Navigator.push(
                context,
                PageRouteBuilder(
                  pageBuilder: (context, animation, secondaryAnimation) =>
                      ChatPage(
                    groupName: group['name'],
                    messages: [
                      Message(
                        sender: 'Joui',
                        text: 'Hello!',
                        time: DateTime.now(),
                      ),
                    ],
                  ),
                  transitionsBuilder:
                      (context, animation, secondaryAnimation, child) {
                    return SlideTransition(
                      position: Tween<Offset>(
                        begin: const Offset(1.0, 0.0),
                        end: Offset.zero,
                      ).animate(animation),
                      child: child,
                    );
                  },
                ),
              );
            },
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor:
                    group['isPinned'] ? Colors.red : Colors.blueAccent,
                child: Text(group['name'][0]),
              ),
              title: Text(group['name']),
              subtitle: Text('${group['lastMessage']} - ${group['time']}'),
              trailing: group['isPinned']
                  ? Icon(Icons.push_pin)
                  : Icon(Icons.chevron_right),
            ),
          );
        },
      ),
    );
  }
}
