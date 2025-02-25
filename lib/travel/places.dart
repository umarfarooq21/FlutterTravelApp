
class Place {
  final String name;
  final double latitude;
  final double longitude;
  final int rank;
  final String country;
  final int totalVisits;

  Place({
    required this.name,
    required this.latitude,
    required this.longitude,
    required this.rank,
    required this.country,
    required this.totalVisits,
  });
}

final List<Place> places = [
  Place(
    name: "Eiffel Tower",
    latitude: 48.8584,
    longitude: 2.2945,
    rank: 1,
    country: "France",
    totalVisits: 7000000,
  ),
  Place(
    name: "Great Wall of China",
    latitude: 40.4319,
    longitude: 116.5704,
    rank: 2,
    country: "China",
    totalVisits: 6000000,
  ),
  Place(
    name: "Statue of Liberty",
    latitude: 40.6892,
    longitude: -74.0445,
    rank: 3,
    country: "USA",
    totalVisits: 4500000,
  ),
  // Add more places here...
];