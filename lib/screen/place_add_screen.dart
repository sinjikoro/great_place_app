import 'dart:io';

import 'package:flutter/material.dart';
import 'package:great_place_app/providers/great_places.dart';
import 'package:great_place_app/screen/map_screen.dart';
import 'package:great_place_app/widgets/image_input.dart';
import 'package:great_place_app/widgets/location_input.dart';
import 'package:provider/provider.dart';

class PlaceAddScreen extends StatefulWidget {
  static const String routeName = '/add-place';

  const PlaceAddScreen({super.key});

  @override
  State<PlaceAddScreen> createState() => _PlaceAddScreenState();
}

class _PlaceAddScreenState extends State<PlaceAddScreen> {
  final _titleController = TextEditingController();
  late File? _pickedImage;

  _selectImage(File pickedImage) {
    _pickedImage = pickedImage;
  }

  void _savePlace() {
    if (_titleController.text.isEmpty || _pickedImage == null) return;
    Provider.of<GreatPlaces>(context, listen: false)
        .addPlace(_titleController.text, _pickedImage!);
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('add a new place')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
              child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(children: [
                TextField(
                  decoration: const InputDecoration(labelText: 'Title'),
                  controller: _titleController,
                ),
                const SizedBox(height: 10),
                ImageInput(onSelectImage: _selectImage),
                const SizedBox(height: 10),
                const LocationInput()
              ]),
            ),
          )),
          ElevatedButton.icon(
            onPressed: _savePlace,
            icon: const Icon(Icons.add),
            label: const Text('Add Place'),
            style: ElevatedButton.styleFrom(
              elevation: 0.0,
              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              backgroundColor: Theme.of(context).colorScheme.secondary,
            ),
          ),
        ],
      ),
    );
  }
}
