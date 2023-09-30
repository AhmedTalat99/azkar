import 'package:azkar/views/home_view.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(       
        appBarTheme:const AppBarTheme(
          centerTitle:true,
          elevation: 0,
        )
      ),
      home:const HomeView(),
    );
  }
}
