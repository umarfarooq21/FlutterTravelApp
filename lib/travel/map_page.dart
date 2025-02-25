import 'package:flutter/material.dart';
import 'package:flutter_travel_app/travel/places.dart';
/*
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapScreen extends StatefulWidget {
  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  late GoogleMapController mapController;
  final Map<MarkerId, Marker> markers = {};

  @override
  void initState() {
    super.initState();
    _addMarkers();
  }

  void _addMarkers() {
    for (var place in places) {
      final markerId = MarkerId(place.name);
      final marker = Marker(
        markerId: markerId,
        position: LatLng(place.latitude, place.longitude),
        infoWindow: InfoWindow(
          title: place.name,
          snippet: 'Rank: ${place.rank}, Country: ${place.country}, Visits: ${place.totalVisits}',
        ),
        onTap: () {
          _showPlaceDetails(place);
        },
      );
      markers[markerId] = marker;
    }
  }

  void _showPlaceDetails(Place place) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(place.name),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Rank: ${place.rank}'),
              Text('Country: ${place.country}'),
              Text('Total Visits: ${place.totalVisits}'),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Close'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Top 20 Most Visited Places 2024'),
      ),
      body: GoogleMap(
        onMapCreated: (controller) {
          setState(() {
            mapController = controller;
          });
        },
        initialCameraPosition: CameraPosition(
          target: LatLng(48.8584, 2.2945), // Center on Eiffel Tower
          zoom: 2,
        ),
        markers: Set<Marker>.of(markers.values),
      ),
    );
  }
}*/