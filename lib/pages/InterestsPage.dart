import 'package:flutter/material.dart';

class InterestsPage extends StatelessWidget {
  final List<String> interests;

  InterestsPage({required this.interests});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Intereses'),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Tus intereses:',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
              Column(
                children: interests
                    .map(
                      (interest) => Column(
                        children: [
                          ListTile(
                            title: Text(interest),
                          ),
                          Divider(),
                        ],
                      ),
                    )
                    .toList(),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {},
                child: Text('Editar'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
