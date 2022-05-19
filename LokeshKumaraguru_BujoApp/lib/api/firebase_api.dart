import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:bujo_app/model/bujo.dart';
import 'package:bujo_app/utils.dart';

class FirebaseAPI {
  static Future<String> createBujo(Bujo bujo) async {
    final docBujo = FirebaseFirestore.instance.collection('bujo').doc();
    bujo.id = docBujo.id;
    await docBujo.set(bujo.toJson());
    return docBujo.id;
  }

  static Future updateBujo (Bujo bujo) async {
    final docBujo = FirebaseFirestore.instance.collection('bujo').doc(bujo.id);

    await docBujo.update(bujo.toJson());
  }

  static Future deleteBujo (Bujo bujo) async {
    final docBujo = FirebaseFirestore.instance.collection('bujo').doc(bujo.id);

    await docBujo.delete();
  }
}