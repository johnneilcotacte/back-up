import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.transparent,
      automaticallyImplyLeading: false,
      actions: [
        Expanded(child: SizedBox()),
        Container(
          padding: EdgeInsets.only(right: 50),
          child: Row(
            children: [
              CircleAvatar(
                backgroundColor: Colors.green,
                backgroundImage: AssetImage('assets/images/paksiw.jpg'),
              ),
              SizedBox(
                width: 20,
              ),
              Text(
                'Your Name',
                style: TextStyle(color: Colors.black),
              ),
            ],
          ),
        )
      ],
    );
  }
}
