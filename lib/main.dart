import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'ui/trending_screen/trending_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: TrendingScreen(),
    );
  }
}
