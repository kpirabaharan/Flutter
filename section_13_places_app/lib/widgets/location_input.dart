import 'package:flutter/material.dart';
import 'package:location/location.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../helpers/location_helper.dart';
import '../screens/map_screen.dart';

class LocationInput extends StatefulWidget {
  final Function onSelectPlace;

  // ignore: prefer_const_constructors_in_immutables, use_key_in_widget_constructors
  LocationInput(this.onSelectPlace);

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
    widget.onSelectPlace(locData.latitude, locData.longitude);
  }

  Future<void> _selectOnMap() async {
    final LatLng selectedLocation = await Navigator.of(context).push(
      MaterialPageRoute(
        fullscreenDialog: true,
        builder: (context) => const MapsScreen(
          isSelecting: true,
        ),
      ),
    ) as LatLng;

    final mapUrl = LocationHelper.generateLocationImage(
      latitude: selectedLocation.latitude,
      longitude: selectedLocation.longitude,
    );

    setState(() {
      _previewImageUrl = mapUrl;
    });

    widget.onSelectPlace(selectedLocation.latitude, selectedLocation.longitude);
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
