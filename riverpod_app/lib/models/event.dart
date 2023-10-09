class Event {
  final String id;
  final String title;
  final String description;
  final String location;
  final String date;
  final String image;
  final bool isFeatured;

  Event({
    required this.id,
    required this.title,
    required this.description,
    required this.location,
    required this.date,
    required this.image,
    required this.isFeatured,
  });

  factory Event.fromJson(Map<String, dynamic> json) {
    return Event(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      location: json['location'],
      date: json['date'],
      image: json['image'],
      isFeatured: json['isFeatured'],
    );
  }
}
