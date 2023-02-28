import 'package:flutter/material.dart';
import 'package:great_place_app/providers/great_places.dart';
import 'package:great_place_app/screen/place_add_screen.dart';
import 'package:great_place_app/screen/place_detail_screen.dart';
import 'package:great_place_app/screen/places_list_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: GreatPlaces(),
      child: MaterialApp(
        title: 'Great Places',
        theme: ThemeData(
          primarySwatch: Colors.indigo,
          colorScheme:
              ColorScheme.fromSwatch().copyWith(secondary: Colors.amber),
        ),
        home: const PlacesListScreen(),
        routes: {
          PlaceAddScreen.routeName: (context) => const PlaceAddScreen(),
          PlaceDetailScreen.routeName: (context) => const PlaceDetailScreen(),
        },
      ),
    );
  }
}
