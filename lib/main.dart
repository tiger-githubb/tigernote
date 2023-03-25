import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:tigernote/screens/home_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(useMaterial3: true),
      title: 'Tiger Game Store',
      home: HomeScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
