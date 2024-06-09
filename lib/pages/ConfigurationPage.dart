import 'package:flutter/material.dart';

class ConfigurationPage extends StatefulWidget {
  final String title;

  ConfigurationPage({required this.title});

  @override
  _ConfigurationPageState createState() => _ConfigurationPageState();
}

class _ConfigurationPageState extends State<ConfigurationPage> {
  TextEditingController _textController = TextEditingController();
  String _exampleText = 'Esta es una descripción de ejemplo del evento...';
  int _wordCount = 0;

  @override
  void initState() {
    super.initState();
    _textController.text = _exampleText;
    _textController.addListener(_updateWordCount);
    _updateWordCount();
  }

  void _updateWordCount() {
    setState(() {
      _wordCount = _textController.text
          .split(' ')
          .where((word) => word.isNotEmpty)
          .length;
    });
  }

  void _editDescription() {
    setState(() {
      _exampleText = _textController.text;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Descripción del evento:',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            TextField(
              controller: _textController,
              maxLines: 5,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Escribe la descripción aquí...',
              ),
            ),
            SizedBox(height: 10),
            Text(
              'Palabras: $_wordCount  /100',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _editDescription,
              child: Text('Editar'),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }
}
