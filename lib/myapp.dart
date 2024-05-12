import 'package:flutter/material.dart';

import 'myhomepage.dart';

class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(buttonTheme: const ButtonThemeData(buttonColor: Colors.white)),
      home: const MyHomePage(),
    );
  }
}
