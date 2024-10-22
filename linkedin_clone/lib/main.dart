import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'viewmodels/post_view_model.dart';
import 'views/home_screen.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => PostViewModel(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'LinkedIn Clone',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const HomeScreen(),
    );
  }
}
