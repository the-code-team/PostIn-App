class Event {
  final String name;
  final String host;
  final DateTime startDate;
  final DateTime endDate;
  final String image;
  final String location;

  Event({
    required this.name,
    required this.host,
    required this.startDate,
    required this.endDate,
    required this.image,
    required this.location,
  });

  bool get isUpcoming => endDate.isAfter(DateTime.now());
}
