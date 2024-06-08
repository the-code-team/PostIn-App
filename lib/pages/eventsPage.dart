import 'package:flutter/material.dart';
import 'eventDetailsPage.dart';
import 'Event.dart';

class EventsPage extends StatelessWidget {
  final List<Event> events = [
    Event(
      name: "Fiesta ibicenca",
      host: "@hector54",
      startDate: DateTime(2024, 7, 1),
      endDate: DateTime(2024, 7, 2),
      image: 'assets/fila.jpg',
      location: 'fila navarros, Alcoy',
    ),
    Event(
      name: "Quedada bar",
      host: "@mariaaaa",
      startDate: DateTime(2024, 7, 7),
      endDate: DateTime(2024, 7, 8),
      image: 'assets/plaza_dins.jpg',
      location: 'plaza dins, Alcoy',
    ),
    Event(
      name: "Previa casa",
      host: "@adrianR",
      startDate: DateTime(2023, 5, 1),
      endDate: DateTime(2023, 5, 2),
      image: 'assets/next_event_image.jpg',
      location: 'plaza españa, nº30, Alcoy',
    ),
    Event(
      name: "Fiesta de bienvenida UPV",
      host: "@Upv",
      startDate: DateTime(2023, 6, 1),
      endDate: DateTime(2023, 6, 2),
      image: 'assets/upv.jpeg',
      location: 'Upv, alcoy',
    ),
    Event(
      name: "Charla IA",
      host: "@Upv",
      startDate: DateTime(2023, 7, 1),
      endDate: DateTime(2023, 7, 2),
      image: 'assets/upv.jpeg',
      location: 'Upv, alcoy',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final upcomingEvents = events.where((event) => event.isUpcoming).toList();
    final pastEvents = events.where((event) => !event.isUpcoming).toList();

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
              //Próximos eventos
              ...upcomingEvents.map((event) => buildEventCard(context, event)),
              //Eventos que ya han pasado
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
              ...pastEvents.map((event) => buildPastEventItem(context, event)),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildEventCard(BuildContext context, Event event) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 10),
      color: Colors.white,
      child: GestureDetector(
        onTap: () {
          _navigateToEventDetails(context, event);
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              margin: EdgeInsets.all(10),
              child: Image.asset(
                event.image,
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
                    event.name,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'Host: ${event.host}',
                    style: TextStyle(fontSize: 16),
                  ),
                  Text(
                    'Duración: ${event.startDate.day}/${event.startDate.month}/${event.startDate.year} - ${event.endDate.day}/${event.endDate.month}/${event.endDate.year}',
                    style: TextStyle(fontSize: 16),
                  ),
                  Text(
                    'Ubicación: ${event.location}',
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildPastEventItem(BuildContext context, Event event) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 5),
      child: GestureDetector(
        onTap: () {
          _navigateToEventDetails(context, event);
        },
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.asset(
                event.image,
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
                    event.name,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'Host: ${event.host}',
                    style: TextStyle(fontSize: 14),
                  ),
                  Text(
                    'Duración: ${event.startDate.day}/${event.startDate.month}/${event.startDate.year} - ${event.endDate.day}/${event.endDate.month}/${event.endDate.year}',
                    style: TextStyle(fontSize: 14),
                  ),
                  Text(
                    'Ubicación: ${event.location}',
                    style: TextStyle(fontSize: 14),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _navigateToEventDetails(BuildContext context, Event event) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => EventDetailsPage(event: event),
      ),
    );
  }
}
