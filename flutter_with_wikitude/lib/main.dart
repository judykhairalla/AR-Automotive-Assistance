import 'package:flutter/material.dart';
import 'package:flutter_with_wikitude/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: MyRouter.router,
      title: 'Arabeitak',
       theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  }
}
