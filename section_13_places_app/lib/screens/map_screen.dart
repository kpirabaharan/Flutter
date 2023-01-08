import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../models/place.dart' as place;

class MapsScreen extends StatefulWidget {
  final place.Location initialLocation;
  final bool isSelecting;

  // ignore: use_key_in_widget_constructors
  const MapsScreen(
      {this.initialLocation =
          const place.Location(latitude: 37.422, longitude: -122.084),
      this.isSelecting = false});

  @override
  State<MapsScreen> createState() => _MapsScreenState();
}

class _MapsScreenState extends State<MapsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Map'),
      ),
      body: GoogleMap(
        initialCameraPosition: CameraPosition(
            target: LatLng(
              widget.initialLocation.latitude,
              widget.initialLocation.longitude,
            ),
            zoom: 16),
      ),
    );
  }
}
