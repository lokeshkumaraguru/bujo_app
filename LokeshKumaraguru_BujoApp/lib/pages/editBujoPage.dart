import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:bujo_app/model/bujo.dart';
import 'package:bujo_app/provider/bujos.dart';
import 'package:bujo_app/widgets/BujoFormWidget.dart';

class EditBujoPage extends StatefulWidget {
  final Bujo bujo;

  const EditBujoPage({
    Key? key,
    required this.bujo,
  }) : super(key: key);

  @override
  _EditBujoPageState createState() => _EditBujoPageState();
}

class _EditBujoPageState extends State<EditBujoPage> {
  final _formKey = GlobalKey<FormState>();

  String title = '';
  String description = '';

  @override
  void initState() {
    super.initState();

    title = widget.bujo.title;
    description = widget.bujo.description;
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      title: Text('What has changed?'),
      actions: [
        IconButton(
          icon: Icon(Icons.delete),
          onPressed: () {
            final provider = Provider.of<BujosProvider>(context, listen: false);
            provider.removeBujo(widget.bujo);

            Navigator.of(context).pop();
          },
        )
      ],
    ),
    body: Padding(
      padding: EdgeInsets.all(15),
      child: Form(
        key: _formKey,
        child: BujoFormWidget(
          title: title,
          description: description,
          onChangedTitle: (title) => setState(() => this.title = title),
          onChangedDescription: (description) => setState(() => this.description = description),
          onSavedBujo: saveBujo,
        ),
      ),
    ),
  );

  void saveBujo() {
    final isValid = _formKey.currentState!.validate();

    if(!isValid) {
      return;
    }
    else {
      final provider = Provider.of<BujosProvider>(context, listen: false);

      provider.updateBujo(widget.bujo, title, description);

      Navigator.of(context).pop();
    }
  }
}