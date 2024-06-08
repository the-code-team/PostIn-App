import 'package:flutter/material.dart';
import 'Event.dart';

class EventDetailsPage extends StatelessWidget {
  final Event event;

  EventDetailsPage({required this.event});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(event.name),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset(
                    event.image,
                    height: 200,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(height: 20),
              Text(
                'Host: ${event.host}',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Text(
                'Fecha: ${event.startDate.day}/${event.startDate.month}/${event.startDate.year} - ${event.endDate.day}/${event.endDate.month}/${event.endDate.year}',
                style: TextStyle(fontSize: 18),
              ),
              SizedBox(height: 10),
              Text(
                'Ubicación: ${event.location}',
                style: TextStyle(fontSize: 18),
              ),
              SizedBox(height: 10),
              Text(
                'Descripción del evento:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Text('Esta es la descripción del evento.'),
              if (event.isUpcoming) ...[
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    // Implementa la lógica para cancelar el evento aquí.
                  },
                  child: Text('Cancelar'),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
