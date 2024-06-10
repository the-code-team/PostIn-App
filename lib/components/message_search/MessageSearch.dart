import 'package:flutter/material.dart';
import './../../models/message.dart';

class MessageSearchDelegate extends SearchDelegate {
  final List<Message> messages;
  final ValueChanged<Message> onSelectMessage;

  MessageSearchDelegate({
    required this.messages,
    required this.onSelectMessage,
  });

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    final results = messages
        .where((msg) => msg.text.contains(query) || msg.sender.contains(query))
        .toList();
    return ListView.builder(
      itemCount: results.length,
      itemBuilder: (context, index) {
        final message = results[index];
        return ListTile(
          title: Text(message.sender),
          subtitle: Text(message.text),
          onTap: () {
            onSelectMessage(message);
            close(context, null);
          },
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestions = messages
        .where((msg) => msg.text.contains(query) || msg.sender.contains(query))
        .toList();
    return ListView.builder(
      itemCount: suggestions.length,
      itemBuilder: (context, index) {
        final message = suggestions[index];
        return ListTile(
          title: Text(message.sender),
          subtitle: Text(message.text),
          onTap: () {
            query = message.text;
            showResults(context);
          },
        );
      },
    );
  }
}
