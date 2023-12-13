import 'package:flutter/material.dart';
import 'package:news_app/controller/ApiController.dart';
import 'package:news_app/view/home_screen/home_screen.dart';
import 'package:news_app/view/search_screen/search_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ApiController()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SearchScreen(),
      ),
    );
  }
}
