class BikeNetwork {
  final String id;
  final String name;
  final String location;

  BikeNetwork({
    required this.id,
    required this.name,
    required this.location,
  });

  factory BikeNetwork.fromJson(Map<String, dynamic> json) {
    final location = json['location'];
    String locationStr = '';

    if (location != null) {
      final city = location['city'] ?? '';
      final country = location['country'] ?? '';
      locationStr = '$city, $country';
    }

    return BikeNetwork(
      id: json['id'],
      name: json['name'],
      location: locationStr,
    );
  }
}
