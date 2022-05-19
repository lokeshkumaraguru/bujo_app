import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:bujo_app/model/bujo.dart';
import 'package:bujo_app/provider/bujos.dart';
import 'package:bujo_app/widgets/BujoFormWidget.dart';

class AddBujoDialogWidget extends StatefulWidget {
  @override
  _AddBujoDialogWidgetState createState() => _AddBujoDialogWidgetState();
}

class _AddBujoDialogWidgetState extends State<AddBujoDialogWidget> {
  final _formKey = GlobalKey<FormState>();
  String title = '';
  String description = '';

  @override
  Widget build(BuildContext context) => AlertDialog(
    content: Form(
      key: _formKey,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Add Bujo',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
          const SizedBox(height: 10),
          BujoFormWidget(
            onChangedTitle: (title) => setState(() => this.title = title),
            onChangedDescription: (description) => setState(() => this.description = description),
            onSavedBujo: addBujo,
          ),
        ],
      ),
    ),
  );

  void addBujo() {
    final isValid = _formKey.currentState!.validate();

    if(!isValid) {
      return;
    }
    else {
      final bujo = Bujo(
        id: DateTime.now().toString(),
        title: title,
        description: description,
        createdTime: DateTime.now(),
      );

      final provider = Provider.of<BujosProvider>(context, listen: false);
      provider.addBujo(bujo);

      Navigator.of(context).pop();
    }
  }
}

/*
import 'package:bujo_app/model/bujo.dart';
import 'package:flutter/material.dart';
import 'package:bujo_app/widgets/BujoFormWidget.dart';
import 'package:bujo_app/provider/bujos.dart';
import 'package:provider/provider.dart';


class AddBujoDialogWidget extends StatefulWidget {
  @override
  _AddBujoDialogWidgetState createState() => _AddBujoDialogWidgetState();
}

class _AddBujoDialogWidgetState extends State<AddBujoDialogWidget> {
  final _formKey = GlobalKey<FormState>();
  String title = '';
  String description = '';

  @override
  Widget build(BuildContext context) => AlertDialog(
    content: Form(
      key: _formKey,
      child: Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Add Todo',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 25,
          ),
        ),
        const SizedBox(height: 8),
        BujoFormWidget(
            onChangedTitle: (title) => setState(() => this.title = title),
            onChangedDescription: (description) => setState(() => this.description = description),
            onSavedBujo: addBujo,
        ),
      ],
      ),
    ),
  );

  void addBujo() {
    final isValid = _formKey.currentState!.validate();

    if (!isValid) {
      return;
    } else {
      final bujo = Bujo(
        id: DateTime.now().toString(),
        title: title,
        description: description,
        createdTime: DateTime.now(),
      );

      final provider = Provider.of<BujoProvider>(context, listen: false);
      provider.addBujo(bujo);

      Navigator.of(context).pop();
    }
  }
}
 */