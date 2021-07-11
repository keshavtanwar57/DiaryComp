import 'package:diary/StoryView.dart';
import 'package:flutter/material.dart';
import 'Login.dart';
import 'Home.dart';
import 'package:firebase_core/firebase_core.dart';

Future<void> main() async {
  try {
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp();
  } catch (e) {
    print('Failed to initiliaze');
  }

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Diary',
      theme: ThemeData.dark(),
      home: Login(),
    );
  }
}
