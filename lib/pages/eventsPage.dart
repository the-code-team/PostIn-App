import 'package:flutter/material.dart';

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
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Container(
                        margin: EdgeInsets.all(10),
                        child: Image.asset(
                          'assets/next_event_image.jpg',
                          height: 200,
                          fit: BoxFit.cover,
                        ),
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
              ),
              //Eventos que ya han pasado
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 20),
                    child: Text(
                      'Eventos Pasados',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  buildPastEventItem(
                    'assets/next_event_image.jpg',
                    'Nombre del Evento 1',
                    'Host 1',
                    'DD/MM/YY - DD/MM/YY',
                  ),
                  buildPastEventItem(
                    'assets/next_event_image.jpg',
                    'Nombre del Evento 2',
                    'Host 2',
                    'DD/MM/YY - DD/MM/YY',
                  ),
                  buildPastEventItem(
                    'assets/next_event_image.jpg',
                    'Nombre del Evento 3',
                    'Host 3',
                    'DD/MM/YY - DD/MM/YY',
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildPastEventItem(
      String image, String name, String host, String duration) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          // Imagen del evento
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
          // Información del evento
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
    );
  }
}
