import 'package:flutter/material.dart';

class WeeklyCalendar extends StatelessWidget {
  const WeeklyCalendar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      decoration:
          BoxDecoration(border: Border.all(width: 0.3), color: Colors.white),
      padding: EdgeInsets.only(left: 50, right: 50),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text('29'),
              SizedBox(
                height: 15,
              ),
              Text(
                'Monday',
              )
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text('30'),
              SizedBox(
                height: 15,
              ),
              Text(
                'Tuesday',
              )
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text('1'),
              SizedBox(
                height: 15,
              ),
              Text(
                'Wednesday',
              )
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text('2'),
              SizedBox(
                height: 15,
              ),
              Text(
                'Thursday',
              )
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                '3',
                style: TextStyle(color: Colors.blue),
              ),
              SizedBox(
                height: 15,
              ),
              Text('Friday', style: TextStyle(color: Colors.blue))
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text('4'),
              SizedBox(
                height: 15,
              ),
              Text(
                'Saturday',
              )
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text('5'),
              SizedBox(
                height: 15,
              ),
              Text(
                'Sunday',
              )
            ],
          ),
        ],
      ),
    );
  }
}
