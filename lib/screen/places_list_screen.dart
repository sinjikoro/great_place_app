import 'package:flutter/material.dart';
import 'package:great_place_app/screen/place_add_screen.dart';

class PlacesListScreen extends StatelessWidget {
  const PlacesListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Places'),
        actions: [
          IconButton(
            onPressed: () =>
                Navigator.of(context).pushNamed(PlaceAddScreen.routeName),
            icon: const Icon(Icons.add),
          )
        ],
      ),
      body: const Center(child: CircularProgressIndicator()),
    );
  }
}
