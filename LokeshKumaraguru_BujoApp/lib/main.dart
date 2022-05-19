import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:bujo_app/pages/home.dart';
import 'package:bujo_app/provider/bujos.dart';

// void main() => runApp(MyApp());

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  static final String title = 'Bujo';

  @override
  Widget build(BuildContext context) => ChangeNotifierProvider(
    create: (context) => BujosProvider(),
    child: MaterialApp(
      debugShowCheckedModeBanner: false,
      title: title,
      theme: ThemeData(
        primarySwatch: Colors.teal,
        scaffoldBackgroundColor: Colors.white,
      ),
      home: HomePage(),
    ),
  );
}


/*
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:bujo_app/pages/home.dart';
import 'package:bujo_app/provider/bujos.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  static final String title = 'Bujo';

  @override
  Widget build(BuildContext context) => ChangeNotifierProvider(
    create: (context) => BujoProvider(),
    child: MaterialApp(
      debugShowCheckedModeBanner: false,
      title: title,
      theme: ThemeData(
        primarySwatch: Colors.red,
        scaffoldBackgroundColor: Colors.white,
      ),
      home: HomePage(),
    ),
  );

}
*/