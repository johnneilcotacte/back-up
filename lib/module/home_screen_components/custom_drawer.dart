import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      color: Colors.grey.shade700,
      child: Drawer(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 56.0,
              child: Center(
                child: Text(
                  'Meal Plan',
                  style: TextStyle(color: Colors.black, fontSize: 16),
                ),
              ),
            ),
            Divider(
              height: 1,
              thickness: 2.0,
              indent: 20,
              endIndent: 20,
            ),
            Padding(
              padding: EdgeInsets.only(top: 10), //add constants here
              child: Container(
                height: 56,
                child: Center(
                  child: Text('Dashboard'),
                ),
              ),
            ),
            Container(
              height: 56,
              child: TextButton.icon(
                  onPressed: () {},
                  icon: FaIcon(
                    FontAwesomeIcons.calendarWeek,
                    color: Colors.black54,
                    size: 14,
                  ),
                  label: Text(
                    'Meal Planner',
                    style: TextStyle(color: Colors.black),
                  )),
            ),
            Container(
              height: 56,
              child: TextButton.icon(
                  onPressed: () {},
                  icon: FaIcon(
                    FontAwesomeIcons.utensils,
                    color: Colors.black54,
                    size: 14,
                  ),
                  label: Text(
                    'Restaurant',
                    style: TextStyle(color: Colors.black),
                  )),
            ),
            Expanded(
              child: Container(),
            ),
            Container(
              height: 56,
              child: TextButton.icon(
                  onPressed: () {},
                  icon: FaIcon(
                    FontAwesomeIcons.userCircle,
                    color: Colors.black54,
                    size: 14,
                  ),
                  label: Text(
                    'User Account',
                    style: TextStyle(color: Colors.black),
                  )),
            ),
            Container(
              height: 56,
              child: TextButton.icon(
                  onPressed: () {},
                  icon: FaIcon(
                    FontAwesomeIcons.signOutAlt,
                    color: Colors.black54,
                    size: 14,
                  ),
                  label: Text(
                    'Logout',
                    style: TextStyle(color: Colors.black),
                  )),
            ),
          ],
        ),
        elevation: 0,
      ),
    );
  }
}
