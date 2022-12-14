import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:introduction_screen/introduction_screen.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return IntroductionScreen(
      pages: [
        PageViewModel(
          title: "Title of introduction page",
          body: "Welcome to the app! This is a description of how it works.",
          image: const Center(
            child: Icon(Icons.waving_hand, size: 50.0),
          ),
        ),
        PageViewModel(
          title: "Title of blue page",
          body:
              "Welcome to the app! This is a description on a page with a blue background.",
          image: Center(
            child:
                Image.network("https://example.com/image.png", height: 175.0),
          ),
          decoration: const PageDecoration(
            pageColor: Colors.blue,
          ),
        ),
        PageViewModel(
          title: "Title of orange text and bold page",
          body:
              "This is a description on a page with an orange title and bold, big body.",
          image: const Center(
            child: Text("👋", style: TextStyle(fontSize: 100.0)),
          ),
          decoration: const PageDecoration(
            titleTextStyle: TextStyle(color: Colors.orange),
            bodyTextStyle:
                TextStyle(fontWeight: FontWeight.w700, fontSize: 20.0),
          ),
        ),
        PageViewModel(
          title: "Title of custom button page",
          body: "This is a description on a page with a custom button below.",
          image: Image.asset("res/images/logo.png", height: 175.0),
          footer: ElevatedButton(
            onPressed: () {
              // On button pressed
            },
            child: const Text("Let's Go!"),
          ),
        ),
        PageViewModel(
          title: "Title of custom body page",
          bodyWidget: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text("Click on "),
              Icon(Icons.edit),
              Text(" to edit a post"),
            ],
          ),
          image: const Center(child: Icon(Icons.android)),
        )
      ],
      showSkipButton: true,
      skip: const Text("Skip"),
      next: const Icon(Icons.navigate_next),
      done: const Icon(Icons.check),
      onSkip: (() {
        GoRouter.of(context).push('/home_page');
      }),
      onDone: () {
        GoRouter.of(context).push('/home_page');
      },
      baseBtnStyle: TextButton.styleFrom(
        backgroundColor: Colors.grey.shade200,
      ),
      skipStyle: TextButton.styleFrom(primary: Colors.red),
      doneStyle: TextButton.styleFrom(
        foregroundColor: Colors.green,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(38.0),
        ),
      ),
      nextStyle: TextButton.styleFrom(primary: Colors.blue),
      dotsDecorator: DotsDecorator(
        size: const Size.square(10.0),
        activeSize: const Size(20.0, 10.0),
        activeColor: Theme.of(context).colorScheme.secondary,
        color: Colors.black26,
        spacing: const EdgeInsets.symmetric(horizontal: 3.0),
        activeShape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(25.0)),
      ),
    );
  }
}
