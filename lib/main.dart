import 'package:collaboration/Screens/Home/login_home.dart';
import 'package:collaboration/Screens/pages/card.dart';
import 'package:collaboration/Screens/pages/card_details.dart';
import 'package:collaboration/state/notifier.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => CardModel(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // theme: ThemeData(fontFamily: ),
      title: 'Collaboration',
      debugShowCheckedModeBanner: false,
      home: const LoginHome(),
    );
  }
}
