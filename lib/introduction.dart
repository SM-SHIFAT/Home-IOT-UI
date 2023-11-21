import 'package:flutter/material.dart';
import 'package:glass/glass.dart';

import 'home.dart';

class IntroductionScreen extends StatelessWidget {
  const IntroductionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: Container(
          padding: EdgeInsets.all(35),
          height: _size.height,
          width: _size.width,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/bg.png"),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Myzone",
                style: TextStyle(color: Colors.white, fontSize: 23),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Easily Control Your Home",
                    style: TextStyle(color: Colors.white, fontSize: 28),
                  ),
                  const SizedBox(
                    height: 35,
                  ),
                  Center(
                    child: Material(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(50),
                      clipBehavior: Clip.antiAlias,
                      child: InkWell(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => const HomeScreen()));
                        },
                        child: Container(
                          width: _size.width - 70,
                          height: (_size.width - 70) / 6,
                          padding: const EdgeInsets.all(15),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              border:
                                  Border.all(color: Colors.white, width: 1.5)),
                          child: const FittedBox(
                              child: Text(
                            "Get Started",
                            style: TextStyle(color: Colors.white, fontSize: 34),
                          )),
                        ),
                      ).asGlass(clipBorderRadius: BorderRadius.circular(50)),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
