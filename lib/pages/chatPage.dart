import 'package:flutter/material.dart';

class ChatPage extends StatelessWidget {
  final String groupName;

  ChatPage({required this.groupName});

  final List<Map<String, dynamic>> messages = [
    {'sender': 'Joui', 'message': '¡Hola! ¿Cómo están?', 'time': '10:15 AM'},
    {'sender': 'Marcos', 'message': 'Todo bien, ¿y tú?', 'time': '10:17 AM'}
    // Añade más mensajes aquí
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chat del $groupName'),
      ),
    );
  }
}
