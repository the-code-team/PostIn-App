import 'package:flutter/material.dart';
import 'eventDetailsPage.dart';

class EventsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Eventos'),
      ),
      body: SingleChildScrollView(
        child: Container(
          color: Colors.white,
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              //Proximo evento
              Card(
                  margin: EdgeInsets.symmetric(vertical: 10),
                  color: Colors.white,
                  child: GestureDetector(
                    onTap: () {
                      _navigateToEventDetails(
                          context, "Nombre del Próximo Evento");
                    },
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Container(
                          margin: EdgeInsets.all(10),
                          child: Image.asset(
                            'assets/next_event_image.jpg',
                            height: 200,
                            fit: BoxFit.cover,
                          ),
                        ),
                        SizedBox(height: 10),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Nombre del Próximo Evento',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                'Host: Nombre del Host',
                                style: TextStyle(fontSize: 16),
                              ),
                              Text(
                                'Duración: DD/MM/YY - DD/MM/YY',
                                style: TextStyle(fontSize: 16),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  )),
              //Eventos que ya han pasado
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 20, bottom: 10),
                    child: Text(
                      'Eventos Pasados',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  buildPastEventItem(
                    'assets/next_event_image.jpg',
                    'Nombre del Evento 1',
                    'Host 1',
                    'DD/MM/YY - DD/MM/YY',
                    context,
                  ),
                  buildPastEventItem(
                    'assets/next_event_image.jpg',
                    'Nombre del Evento 2',
                    'Host 2',
                    'DD/MM/YY - DD/MM/YY',
                    context,
                  ),
                  buildPastEventItem(
                    'assets/next_event_image.jpg',
                    'Nombre del Evento 3',
                    'Host 3',
                    'DD/MM/YY - DD/MM/YY',
                    context,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildPastEventItem(String image, String name, String host,
      String duration, BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(vertical: 5),
        child: GestureDetector(
          onTap: () {
            _navigateToEventDetails(context, name);
          },
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.asset(
                  image,
                  width: 100,
                  height: 100,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'Host: $host',
                      style: TextStyle(fontSize: 14),
                    ),
                    Text(
                      'Duración: $duration',
                      style: TextStyle(fontSize: 14),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }

  void _navigateToEventDetails(BuildContext context, String eventName) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => eventDetailsPage(eventName: eventName),
      ),
    );
  }
}
