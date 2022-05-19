import 'package:bujo_app/api/firebase_api.dart';
import 'package:flutter/cupertino.dart';
import 'package:bujo_app/model/bujo.dart';

class BujosProvider extends ChangeNotifier {
  List<Bujo> _bujos = [
    Bujo(
      createdTime: DateTime.now(),
      title: 'Do the Dishes.',
      description: 'Remember to have your podcast ready.',
    ),
  ];

  List<Bujo> get bujos => _bujos.where((bujo) => bujo.isDone == false).toList();

  List<Bujo> get bujosArchived => _bujos.where((bujo) => bujo.isDone == true).toList();

  void addBujo(Bujo bujo) {
    _bujos.add(bujo);

    FirebaseAPI.createBujo(bujo);

    notifyListeners();
  }

  void removeBujo(Bujo bujo) {
    _bujos.remove(bujo);

    FirebaseAPI.deleteBujo(bujo);

    notifyListeners();
  }

  bool toggleBujoStatus(Bujo bujo) {
    bujo.isDone = !bujo.isDone;
    notifyListeners();

    return bujo.isDone;
  }

  void updateBujo(Bujo bujo, String title, String description) {
    bujo.title = title;
    bujo.description = description;

    FirebaseAPI.updateBujo(bujo);

    notifyListeners();
  }
}

/*
import 'package:flutter/cupertino.dart';
import 'package:bujo_app/model/bujo.dart';

class BujoProvider extends ChangeNotifier{
  List<Bujo> _bujos = [
    Bujo(
      createdTime: DateTime.now(),
      title: 'Make sure to take out the trash.',
    ),
  ];

  List<Bujo> get bujos => _bujos.where((bujo) => bujo.isDone == false).toList();

  void addBujo(Bujo bujo) {
    _bujos.add(bujo);

    notifyListeners();
  }
}
 */