import 'package:flutter/material.dart';
import 'home.dart';
import 'package:postin_app/components/jsonComunicator/jsonIO.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    saveInMemory();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: Colors.black,
        unselectedWidgetColor: Colors.grey,
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}
