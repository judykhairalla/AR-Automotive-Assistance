import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Arabeitak"),),
      body: SafeArea(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("Welcome!"),
              ElevatedButton(
                child: const Text("Start"),
                onPressed: () {
                  GoRouter.of(context).push('/ar/intro_page');
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
