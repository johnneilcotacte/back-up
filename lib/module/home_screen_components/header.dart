import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  const Header({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Flexible(
      flex: 3,
      fit: FlexFit.tight,
      child: Container(
        decoration: BoxDecoration(
            border: Border(
              right: BorderSide(width: 0.3),
              top: BorderSide(width: 0.3),
            ),
            color: Colors.white),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Plan your Week',
              style: TextStyle(color: Colors.black),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              'Meal Planner',
              style: TextStyle(color: Colors.black, fontSize: 35),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              'November 29, 2021 - December 3, 2021',
              style: TextStyle(color: Colors.black),
            ),
          ],
        ),
      ),
    );
  }
}
