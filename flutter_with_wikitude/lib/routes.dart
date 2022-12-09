import 'package:flutter_with_wikitude/models/sample.dart';
import 'package:flutter_with_wikitude/views/ar/ar_view.dart';
import 'package:flutter_with_wikitude/views/ar/intro_page.dart';
import 'package:flutter_with_wikitude/views/home_page.dart';
import 'package:go_router/go_router.dart';

class MyRouter {
  MyRouter();
  static final router = GoRouter(
    debugLogDiagnostics: true, //set to false in Production
    routes: [
      GoRoute(path: '/', builder: (context, state) => const HomePage()), 
      GoRoute(
          path: '/ar/intro_page',
          builder: (context, state) => const IntroPage()),   
      GoRoute(
          path: '/ar/arview',
          builder: (context, state) =>
              ARView(sample: state.extra as Sample)),  
    ],
  );
}
