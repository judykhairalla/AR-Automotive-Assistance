import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:introduction_screen/introduction_screen.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return IntroductionScreen(
      globalBackgroundColor: Colors.white,
      pages: [
        CustomPageView(context, "A step by step guide to maintain your car."),
        CustomPageView(context,
            "Replace the paper-based manuals through following instructions overlaid onto your screen.")
      ],
      baseBtnStyle: TextButton.styleFrom(
          backgroundColor: Colors.transparent, foregroundColor: Colors.black87),
      showSkipButton: true,
      skip: const Text("Skip"),
      onSkip: (() {
        GoRouter.of(context).push('/home_page');
      }),
      next: const Icon(Icons.navigate_next),
      done: const Icon(Icons.check),
      onDone: () {
        GoRouter.of(context).push('/home_page');
      },
      dotsDecorator: DotsDecorator(
        size: const Size.square(10.0),
        activeSize: const Size(40.0, 10.0),
        activeColor: Colors.black87,
        color: Colors.grey.shade300,
        spacing: const EdgeInsets.symmetric(horizontal: 3.0),
        activeShape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(25.0)),
      ),
    );
  }

  PageViewModel CustomPageView(BuildContext context, String text) {
    return PageViewModel(
      title: "",
      bodyWidget: FittedBox(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image(
              image: const AssetImage("assets/images/car_left.png"),
              alignment: Alignment.centerLeft,
              height: MediaQuery.of(context).size.height,
            ),
            Padding(
              padding: const EdgeInsets.all(11.0),
              child: Container(
                width: MediaQuery.of(context).size.width / 3,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("ARabeitak",
                          style: TextStyle(
                            fontSize: MediaQuery.of(context).size.height / 21,
                            fontWeight: FontWeight.w600,
                          )),
                      Text(text,
                          style: TextStyle(
                            fontSize: MediaQuery.of(context).size.height / 27,
                          )),
                    ]),
              ),
            ),
            Image(
              image: const AssetImage("assets/images/car_right.png"),
              alignment: Alignment.centerRight,
              height: MediaQuery.of(context).size.height,
            ),
          ],
        ),
      ),
      decoration: const PageDecoration(
        pageColor: Colors.white,
      ),
    );
  }
}
