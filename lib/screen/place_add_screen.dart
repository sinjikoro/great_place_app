import 'package:flutter/material.dart';
import 'package:great_place_app/widgets/image_input.dart';

class PlaceAddScreen extends StatefulWidget {
  static const String routeName = '/add-place';

  const PlaceAddScreen({super.key});

  @override
  State<PlaceAddScreen> createState() => _PlaceAddScreenState();
}

class _PlaceAddScreenState extends State<PlaceAddScreen> {
  final _titleController = TextEditingController();

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
                const ImageInput(),
              ]),
            ),
          )),
          ElevatedButton.icon(
            onPressed: () {},
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
