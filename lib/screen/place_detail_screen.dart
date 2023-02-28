import 'package:flutter/material.dart';
import 'package:great_place_app/providers/great_places.dart';
import 'package:great_place_app/screen/map_screen.dart';
import 'package:provider/provider.dart';

class PlaceDetailScreen extends StatelessWidget {
  static const routeName = '/place-detail';
  const PlaceDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final id = ModalRoute.of(context)!.settings.arguments as String;
    final selectedPlace =
        Provider.of<GreatPlaces>(context, listen: false).findById(id);

    return Scaffold(
      appBar: AppBar(title: Text(selectedPlace.title)),
      body: Column(children: [
        SizedBox(
          height: 250,
          width: double.infinity,
          child: Image.file(
            selectedPlace.image,
            fit: BoxFit.cover,
            width: double.infinity,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          selectedPlace.title,
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 20, color: Colors.grey),
        ),
        TextButton(
          onPressed: () => Navigator.of(context).push(MaterialPageRoute(
              fullscreenDialog: true,
              builder: ((context) => MapScreen(
                    initialLocation: selectedPlace.location,
                  )))),
          style: ButtonStyle(
              foregroundColor:
                  MaterialStateProperty.all(Theme.of(context).primaryColor)),
          child: const Text('View on Map'),
        ),
      ]),
    );
  }
}
