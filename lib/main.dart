import 'package:flutter/material.dart';
import 'package:world_time_app/pages/home.dart';
import 'package:world_time_app/pages/chooseLocation.dart';
import 'package:world_time_app/pages/loading.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/loading',
      routes: {
        '/home': (context) => const Home(),
        '/loading': (context) => const Loading(),
        '/chooseLocation': (context) => const ChooseLocation(),
      },
    );
  }
}
