import 'package:flutter/material.dart';

class BujoFormWidget extends StatelessWidget {
  final String title;
  final String description;
  final ValueChanged<String> onChangedTitle;
  final ValueChanged<String> onChangedDescription;
  final VoidCallback onSavedBujo;

  const BujoFormWidget({
    Key? key,
    this.title = '',
    this.description = '',
    required this.onChangedTitle,
    required this.onChangedDescription,
    required this.onSavedBujo,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => SingleChildScrollView(
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        buildTitle(),
        SizedBox(height: 10),
        buildDescription(),
        SizedBox(height: 10),
        buildButton(),
      ],
    ),
  );

  Widget buildTitle() => TextFormField(
    initialValue: title,
    onChanged: onChangedTitle,
    validator: (title) {
      if(title!.isEmpty) {
        return 'Please enter a title for this Bujo.';
      }
      return null;
    },
    decoration: InputDecoration(
      border: UnderlineInputBorder(),
      labelText: 'Title',
    ),
  );

  Widget buildDescription() => TextFormField(
    initialValue: description,
    onChanged: onChangedDescription,
    decoration: InputDecoration(
      border: UnderlineInputBorder(),
      labelText: 'Description',
    ),
  );

  Widget buildButton() => SizedBox(
    child: ElevatedButton(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(Colors.black),
      ),
      onPressed: onSavedBujo,
      child: Text('Add'),
    ),
  );
}

/*
import 'package:flutter/material.dart';

class BujoFormWidget extends StatelessWidget {
  final String title;
  final String description;
  final ValueChanged<String> onChangedTitle;
  final ValueChanged<String> onChangedDescription;
  final VoidCallback onSavedBujo;

  const BujoFormWidget({
    Key? key,
    this.title = '',
    this.description = '',
    required this.onChangedTitle,
    required this.onChangedDescription,
    required this.onSavedBujo,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => SingleChildScrollView(
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        buildTitle(),
        SizedBox(height: 10),
        buildDescription(),
        SizedBox(height: 10),
        buildButton(),
      ],
    ),
  );

  Widget buildTitle() => TextFormField(
    initialValue: title,
    onChanged: onChangedTitle,
    validator: (title) {
      if(title!.isEmpty) {
        return 'Please enter a title.';
      }
      return null;
    },

    decoration: InputDecoration(
      border: UnderlineInputBorder(),
      labelText: 'Title',
    ),
  );

  Widget buildDescription() => TextFormField(
    initialValue: description,
    onChanged: onChangedDescription,
    decoration: InputDecoration(
      border: UnderlineInputBorder(),
      labelText: 'Description',
    ),
  );

  Widget buildButton() => ElevatedButton(
    style: ButtonStyle(
      backgroundColor: MaterialStateProperty.all(Colors.black),
    ),
    onPressed: onSavedBujo,
    child: Text('Save'),
  );
}
 */