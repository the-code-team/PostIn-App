import 'package:flutter/material.dart';
import 'home.dart';
import 'package:postin_app/components/jsonComunicator/jsonIO.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: saveInMemory(),
      builder: (BuildContext context, AsyncSnapshot<void> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          // Mientras se carga, puedes mostrar un indicador de carga
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            home: Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            ),
          );
        } else {
          // Cuando la operación haya finalizado, construye la aplicación normalmente
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
      },
    );
  }
}
