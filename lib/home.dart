import 'package:flutter/material.dart';

import 'grid_item.dart';
import 'list_item.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _scrollController = ScrollController();
  int _pageIndex = 0;
  bool _isMax = true;
  bool _isMin = true;
  bool _isMid = true;
  List<IconData> _icons = [
    Icons.chair_outlined,
    Icons.bed_outlined,
    Icons.kitchen_outlined,
    Icons.bathtub_outlined,
    Icons.restaurant_outlined,
    Icons.movie_outlined,
    Icons.calendar_month_outlined,
    Icons.calendar_month_outlined,
    Icons.calendar_month_outlined,
    Icons.calendar_month_outlined
  ];
  List<String> _names = [
    "Living Room",
    "Bedroom",
    "Kitchen",
    "Bathroom",
    "Dining Room",
    "Hall Room",
    "Another Room",
    "Another Room",
    "Another Room",
    "Another Room",
  ];

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      if (_scrollController.offset ==
          _scrollController.position.maxScrollExtent) {
        setState(() {
          _isMax = true;
          _isMin = false;
          _isMid = false;
        });
        print("max");
      } else if (_scrollController.offset ==
          _scrollController.position.minScrollExtent) {
        setState(() {
          _isMax = false;
          _isMin = true;
          _isMid = false;
        });

        print("min");
      } else {
        setState(() {
          _isMax = false;
          _isMin = false;
          _isMid = true;
        });
        print("middle");
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: const Color.fromARGB(255, 233, 235, 241),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
              flex: 1,
              child: Column(
                children: [
                  const Expanded(
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 25,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Hi Johnson!",
                            style: TextStyle(
                                fontSize: 28, fontWeight: FontWeight.bold),
                          ),
                          CircleAvatar(
                            child: Icon(Icons.person),
                          )
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 25, vertical: 8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Rooms",
                          style: TextStyle(
                              fontSize: 22, fontWeight: FontWeight.w500),
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.arrow_back_ios,
                              size: 16,
                              color: (_isMax == true || _isMid == true)
                                  ? Colors.black
                                  : Color.fromARGB(255, 187, 187, 187),
                            ),
                            Icon(
                              Icons.arrow_forward_ios,
                              size: 16,
                              color: (_isMin == true || _isMid == true)
                                  ? Colors.black
                                  : Color.fromARGB(255, 187, 187, 187),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: ListView.separated(
                      controller: _scrollController,
                      scrollDirection: Axis.horizontal,
                      itemCount: _icons.length,
                      padding: EdgeInsets.only(left: 25, right: 25),
                      shrinkWrap: true,
                      separatorBuilder: (BuildContext context, int index) =>
                          const SizedBox(
                        height: 10,
                        width: 10,
                      ),
                      itemBuilder: (ctx, index) {
                        return ListItem(
                          icon: _icons[index],
                          name: _names[index],
                        );
                      },
                    ),
                  ),
                ],
              )),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 25, vertical: 18),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Bedroom",
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
                ),
                Text(
                  "(4 devices Connected)",
                  style: TextStyle(fontSize: 12),
                ),
              ],
            ),
          ),
          Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      child: Container(
                        child: const Row(
                          children: [
                            Expanded(
                              child: GridItem(
                                icon: Icons.wb_incandescent_outlined,
                                text: "Smart \nLighting",
                              ),
                            ),
                            SizedBox(
                              width: 18,
                            ),
                            Expanded(
                              child: GridItem(
                                icon: Icons.speaker_phone_outlined,
                                text: "Smart \nSpeaker",
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Expanded(
                      child: Container(
                        child: const Row(
                          children: [
                            Expanded(
                              child: GridItem(
                                icon: Icons.tv,
                                text: "Smart \nTV",
                              ),
                            ),
                            SizedBox(
                              width: 18,
                            ),
                            Expanded(
                              child: GridItem(
                                icon: Icons.ac_unit_outlined,
                                text: "Air \nConditioner",
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              )),
          const SizedBox(height: 15),
        ],
      ),
//padding: const EdgeInsets.only(left: 25, right: 25, top: 5, bottom: 10),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(left: 25, right: 25, top: 5, bottom: 10),
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Theme(
              data: Theme.of(context)
                  .copyWith(splashFactory: InkRipple.splashFactory),
              child: BottomNavigationBar(
                type: BottomNavigationBarType.fixed,
                backgroundColor: Colors.transparent,
                elevation: 0,
                iconSize: 28,
                showSelectedLabels: false,
                showUnselectedLabels: false,
                currentIndex: _pageIndex,
                onTap: (index) {
                  setState(() {
                    _pageIndex = index;
                  });
                },
                items: [
                  BottomNavigationBarItem(
                    icon: Icon(Icons.home_outlined),
                    label: "home",
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.notifications_outlined),
                    label: "home",
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(
                      Icons.notifications_outlined,
                      color: Colors.transparent,
                      size: 0,
                    ),
                    label: "home",
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.settings_outlined),
                    label: "home",
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.person_outline),
                    label: "home",
                  ),
                ],
              ),
            ),
            Positioned(
              left: 0,
              right: 0,
              bottom: 5,
              top: 5,
              child: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color.fromARGB(255, 20, 43, 94)),
                  child: const Icon(
                    Icons.add,
                    color: Colors.white,
                  )),
            ),
          ],
        ),
      ),
      // Container(
      //   //color: Colors.amber,
      //   height: 80,
      //   child: Row(
      //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      //     children: [
      //       const Icon(Icons.home_outlined),
      //       const Icon(Icons.notifications_outlined),
      //       Container(
      //           padding: const EdgeInsets.all(8),
      //           decoration: const BoxDecoration(
      //               shape: BoxShape.circle,
      //               color: Color.fromARGB(255, 20, 43, 94)),
      //           child: const Icon(
      //             Icons.add,
      //             color: Colors.white,
      //           )),
      //       const Icon(Icons.settings_outlined),
      //       const Icon(Icons.person_outline),
      //     ],
      //   ),
      // ),
    ));
  }
}
