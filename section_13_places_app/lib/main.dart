import 'package:flutter/material.dart';

import './screens/places_list_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Great Places',
      darkTheme: ThemeData.dark(),
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.indigo)
            .copyWith(secondary: Colors.amber),
      ),
      home: const PlacesListScreen(),
    );
  }
}
