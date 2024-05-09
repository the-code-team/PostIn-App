import 'package:flutter/material.dart';

class ChatPage extends StatelessWidget {
  final String groupName;

  ChatPage({required this.groupName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('$groupName'),
      ),
    );
  }
}
