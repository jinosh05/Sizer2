import 'package:example/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:sizer_pro/sizer.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Sizer',
          theme: ThemeData.light(),
          home: const HomeScreen(),
        );
      },
    );
  }
}
