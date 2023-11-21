import 'package:flutter/material.dart';

class ListItem extends StatelessWidget {
  const ListItem({
    super.key,
    required this.icon,
    required this.name,
  });

  final IconData icon;
  final String name;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(2),
              child: Container(
                padding: EdgeInsets.all(5),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: FittedBox(
                    child: Icon(
                  icon,
                  size: 30,
                )),
              ),
            ),
          ),
          SizedBox(height: 4),
          Container(
            child: FittedBox(
              child: Text(
                name,
                style: TextStyle(fontSize: 10),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
