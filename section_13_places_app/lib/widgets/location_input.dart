import 'package:flutter/material.dart';
import 'package:location/location.dart';

import '../helpers/location_helper.dart';
import '../screens/map_screen.dart';

class LocationInput extends StatefulWidget {
  const LocationInput({super.key});

  @override
  State<LocationInput> createState() => _LocationInputState();
}

class _LocationInputState extends State<LocationInput> {
  String? _previewImageUrl;

  Future<void> _getCurrentUserLocation() async {
    final locData = await Location().getLocation();
    final mapUrl = LocationHelper.generateLocationImage(
      latitude: locData.latitude as double,
      longitude: locData.longitude as double,
    );

    setState(() {
      _previewImageUrl = mapUrl;
    });
  }

  Future<void> _selectOnMap() async {
    final selectedLocation = await Navigator.of(context).push(
      MaterialPageRoute(
        fullscreenDialog: true,
        builder: (context) => const MapsScreen(
          isSelecting: true,
        ),
      ),
    );
    if (selectedLocation == null) {
      return;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Container(
        alignment: Alignment.center,
        height: 300,
        width: double.infinity,
        decoration: BoxDecoration(
          border: Border.all(width: 1, color: Colors.green),
        ),
        child: _previewImageUrl == null
            ? const Text('No Location Chosen', textAlign: TextAlign.center)
            : Image.network(
                _previewImageUrl as String,
                fit: BoxFit.cover,
                width: double.infinity,
              ),
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextButton.icon(
            icon: const Icon(Icons.location_on),
            label: const Text('Current location'),
            onPressed: _getCurrentUserLocation,
          ),
          TextButton.icon(
            icon: const Icon(Icons.map),
            label: const Text('Select on Map'),
            onPressed: _selectOnMap,
          ),
        ],
      )
    ]);
  }
}
