import 'package:flutter/material.dart';
import 'package:great_place_app/providers/great_places.dart';
import 'package:great_place_app/screen/place_add_screen.dart';
import 'package:great_place_app/screen/place_detail_screen.dart';
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
      body: FutureBuilder(
        future: Provider.of<GreatPlaces>(context, listen: false)
            .fetchAndSetPlaces(),
        builder: (ctx, snapshot) => snapshot.connectionState ==
                ConnectionState.waiting
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : Consumer<GreatPlaces>(
                builder: ((context, greatPlaces, ch) =>
                    greatPlaces.items.isEmpty
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
                                  subtitle:
                                      Text(greatPlaces.items[i].location.title),
                                  onTap: (() {
                                    Navigator.of(context).pushNamed(
                                      PlaceDetailScreen.routeName,
                                      arguments: greatPlaces.items[i].id,
                                    );
                                  }),
                                )),
                          )),
                child: const Center(child: Text('not found images.')),
              ),
      ),
    );
  }
}
