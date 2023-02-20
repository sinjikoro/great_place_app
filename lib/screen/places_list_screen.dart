import 'package:flutter/material.dart';
import 'package:great_place_app/providers/great_places.dart';
import 'package:great_place_app/screen/place_add_screen.dart';
import 'package:provider/provider.dart';

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
      body: Consumer<GreatPlaces>(
        builder: ((context, greatPlaces, ch) => greatPlaces.items.isEmpty
            ? ch!
            : ListView.builder(
                itemCount: greatPlaces.items.length,
                itemBuilder: ((context, i) => ListTile(
                      leading: CircleAvatar(
                        backgroundImage: FileImage(
                          greatPlaces.items[i].image,
                        ),
                      ),
                      title: Text(greatPlaces.items[i].title),
                    )),
              )),
        child: const Center(child: Text('not found images.')),
      ),
    );
  }
}
