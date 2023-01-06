import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './providers/places.dart';
import './screens/places_list_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => Places(),
      child: MaterialApp(
        title: 'Great Places',
        darkTheme: ThemeData.dark(),
        theme: ThemeData(
          colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.indigo)
              .copyWith(secondary: Colors.amber),
        ),
        home: const PlacesListScreen(),
      ),
    );
  }
}
