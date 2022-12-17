import 'package:flutter/material.dart';
import 'package:flutter_with_wikitude/routes.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: MyRouter.router,
      title: 'Arabeitak',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  }
}
