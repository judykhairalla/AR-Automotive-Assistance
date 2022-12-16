import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // title: const Text("ARabeitak", style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
        leading: const BackButton(
          color: Colors.black,
        ),
      ),
      body: SafeArea(
        child: Row(
          children: [
            Image(
              image: const AssetImage("assets/images/car.png"),
              alignment: Alignment.centerRight,
              height: MediaQuery.of(context).size.height,
            ),
            Column(
              children: [
                //     Expanded(
                //       child: Container(
                //         color: Colors.amber,
                //         child: Text('Above'),
                //       ),
                //     ),
                //     const Divider(
                //       height: 20,
                //       thickness: 5,
                //       indent: 20,
                //       endIndent: 0,
                //       color: Colors.black,
                //     ),
                ElevatedButton(
                  child: Row(
                    children: [
                      const Text("Start"),
                      // Icon(Image.asset(
                      //   "assets/images/car.png",
                      //   color: Colors.grey,
                      // )),
                    ],
                  ),
                  onPressed: () {
                    GoRouter.of(context).push('/ar/intro_page');
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
