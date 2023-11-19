class Restaurant {
  final int id;
  final String name;
  final String type;
  final String location;
  final List<int> ratings;
  final List<Map<String, String>> reviews;

  Restaurant({
    required this.id,
    required this.name,
    required this.type,
    required this.location,
    required this.ratings,
    required this.reviews,
  });

  factory Restaurant.fromJson(Map<String, dynamic> json) {
    return Restaurant(
      id: json['id'],
      name: json['name'],
      type: json['type'],
      location: json['location'],
      ratings: List<int>.from(json['ratings']),
      reviews: (json['reviews'] as List<dynamic>).map((review) {
        return {
          'user': review['user'] as String,
          'comment': review['comment'] as String,
        };
      }).toList(),
    );
  }
}
