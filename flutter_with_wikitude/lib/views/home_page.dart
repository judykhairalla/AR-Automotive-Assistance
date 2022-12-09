import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: ElevatedButton(
            child: const Text("Start"),
            onPressed: () {
              GoRouter.of(context).push('/ar/intro_page');
            },
          ),
        ),
      ),
    );
  }
}
