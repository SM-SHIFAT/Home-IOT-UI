import 'package:flutter/material.dart';

class GridItem extends StatefulWidget {
  const GridItem({super.key, required this.icon, required this.text});
  final IconData icon;
  final String text;

  @override
  State<GridItem> createState() => _GridItemState();
}

class _GridItemState extends State<GridItem> {
  bool isOn = false;

  @override
  Widget build(BuildContext context) {
    return PhysicalModel(
      color: const Color.fromARGB(132, 20, 43, 94),
      borderRadius: BorderRadius.circular(20),
      elevation: 0,
      child: Container(
        //color: isOn ? const Color.fromARGB(255, 20, 43, 94) : Colors.white,
        //elevation: 5,
        decoration: BoxDecoration(
          color: isOn ? const Color.fromARGB(255, 20, 43, 94) : Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: isOn
              ? [
                  BoxShadow(
                    color: Color.fromARGB(255, 163, 163, 163),
                    offset: Offset(0, 8),
                    blurRadius: 14,
                    spreadRadius: 0,
                  )
                ]
              : null,
        ),
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(
                widget.icon,
                color:
                    isOn ? Colors.white : const Color.fromARGB(255, 20, 43, 94),
                size: 36,
              ),
              Text(
                widget.text,
                style: TextStyle(
                  color: isOn
                      ? Colors.white
                      : const Color.fromARGB(255, 20, 43, 94),
                  fontSize: 17,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    isOn ? "On" : "Off",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: isOn
                          ? Colors.white
                          : const Color.fromARGB(255, 20, 43, 94),
                      fontSize: 18,
                    ),
                  ),
                  Transform.scale(
                      scale: 0.7,
                      child: Switch(
                          value: isOn,
                          thumbColor:
                              MaterialStateProperty.resolveWith((states) {
                            if (states.contains(MaterialState.selected)) {
                              return Colors.white;
                            }
                            return const Color.fromARGB(255, 20, 43, 94);
                          }),
                          trackColor:
                              MaterialStateProperty.resolveWith((states) {
                            if (states.contains(MaterialState.selected)) {
                              return const Color.fromARGB(255, 20, 43, 94);
                            }
                            return Color.fromARGB(255, 211, 216, 228);
                          }),
                          trackOutlineColor:
                              MaterialStateProperty.all(Colors.white),
                          onChanged: (val) {
                            setState(() {
                              isOn = val;
                            });
                          })),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
