import 'package:flutter_with_wikitude/views/home_page.dart';
import 'package:go_router/go_router.dart';

class MyRouter {
  MyRouter();
  static final router = GoRouter(
    debugLogDiagnostics: true, //set to false in Production
    routes: [
      GoRoute(path: '/', builder: (context, state) => const HomePage()),      
    ],
  );
}
