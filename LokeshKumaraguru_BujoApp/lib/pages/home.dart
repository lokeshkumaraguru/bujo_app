import 'dart:io';

import 'package:bujo_app/api/firebase_api.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:bujo_app/main.dart';
import 'package:bujo_app/widgets/addBujoDialogWidget.dart';
import 'package:bujo_app/widgets/BujoFeedWidget.dart';
import 'package:bujo_app/widgets/ArchiveFeedWidget.dart';
import 'package:image_picker/image_picker.dart';

import '../model/bujo.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  File ? singleImage;

  final singlePicker = ImagePicker();
  final multiPicker = ImagePicker();
  List <XFile> ? images = [];

  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final tabs = [
      BujoListWidget(),
      Container(
        child: InkWell(
          onTap: () {
            getMultiImages();
          },
        child: GridView.builder(
          itemCount: images!.isEmpty ? 1 : images!.length + 1,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 1),
          itemBuilder: (context, index) => Container(
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(
                color: Colors.black)),
            child: images!.isEmpty ? Icon(CupertinoIcons.camera, color: Colors.black) : Image.file(File(images![index].path), fit: BoxFit.cover)
          ),
      ))),
      ArchiveListWidget(),
    ];
//images!.isEmpty ? Icon(CupertinoIcons.camera, color: Colors.black) :
    return Scaffold(
      appBar: AppBar(
        title: Text(MyApp.title),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.white.withOpacity(0.5),
        selectedItemColor: Colors.white,
        currentIndex: selectedIndex,
        onTap: (index) => setState(() {
          selectedIndex = index;
        }),
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.feed),
            label: 'Bujo Feed',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.camera),
            label: 'Snaps',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.archive),
            label: 'Archive',
          ),
        ],
      ),
      body: tabs[selectedIndex],
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).primaryColor,
        onPressed: () => showDialog(
          context: context,
          builder: (context) => AddBujoDialogWidget(),
          barrierDismissible: false,
        ),
        child: Icon(Icons.add),
      ),
    );
  }

  Future getSingleImage() async{
    final pickedImage = await singlePicker.pickImage(source: (ImageSource.gallery));

    setState(() {
      if(pickedImage != null) {
        singleImage = File(pickedImage.path);
      }
      else {
        print('No Image Selected.');
      }
    });
  }

  void getMultiImages() async {
    final List<XFile>? selectedImages = await multiPicker.pickMultiImage();

    setState(() {
      if(selectedImages!.isNotEmpty) {
        images!.addAll(selectedImages);
      }
      else {
        print('No Images Selected.');
      }
    });
  }
}






/*
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:bujo_app/main.dart';
import 'package:bujo_app/widgets/BujoFormWidget.dart';
import 'package:bujo_app/widgets/BujoFeedWidget.dart';
import 'package:image_picker/image_picker.dart';

// import '../utils.dart';

class HomePage extends StatefulWidget {

  @override
  _HomePageState createState() => _HomePageState();

}

class _HomePageState extends State<HomePage> {

  File ? singleImage;

  final singlePicker = ImagePicker();
  final multiPicker = ImagePicker();
  List <XFile>? images = [];

  int selectedIndex = 0;
  String title = '';
  String description = '';
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final tabs = [
      BujoListWidget(),
      Container(
        child: InkWell(
          onTap: () {
            getMultiImages();
    },
        child: GridView.builder(
          itemCount: 10,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 1),
          itemBuilder: (context, index) => Container(
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: Colors.grey.withOpacity(0.3))),
            /*
              child: Icon(
              CupertinoIcons.camera,
              color: Colors.grey.withOpacity(0.5),
            ),
            */
            child: images!.isEmpty ? Icon(CupertinoIcons.camera, color: Colors.grey.withOpacity(0.5),
    ) : Image.file(File(images![index].path), fit: BoxFit.cover,
    )
            //child: images!.isEmpty ? Icon(...):Image.file(File(images![index].))
          ),
        ),
        ),
      ),
      Container(),
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text(MyApp.title),
      ),
      bottomNavigationBar: BottomNavigationBar (
        backgroundColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.white.withOpacity(0.7),
        selectedItemColor: Colors.white,
        currentIndex: selectedIndex,
        onTap: (index) => setState(() {
          selectedIndex = index;
        }),
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.feed),
            label: 'Bujo Feed'
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.archive),
            label: 'Archive',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.task),
            label: 'Completed',
          ),
        ],
      ),
      body: tabs[selectedIndex],
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            child: Icon(Icons.add),
            onPressed: () => showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  content: Form(
                    key: _formKey,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Bullet Journal',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 25,
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
              },
              // child: addBujoDialogWidget(),
              barrierDismissible: true,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          /*
          FloatingActionButton(
            child: Icon(Icons.camera),
            onPressed: () {
            },
          ),
           */
        ],
      ),
    );
  }

  void addBujo () {}

  Future getSingleImage () async {

    final pickedImage = await singlePicker.pickImage(source: (ImageSource.gallery));
    setState(() {
      if(pickedImage != null) {
        singleImage = File(pickedImage.path);
      }
      else {
        print('No Image Selected');
      }
    });
  }

  Future getMultiImages () async {

    final List<XFile>? selectedImages = await multiPicker.pickMultiImage();
    setState(() {
      if (selectedImages!.isNotEmpty) {
        images!.addAll(selectedImages);
      }
      else {
        print('No Images Selected');
      }
    });
  }
}
 */