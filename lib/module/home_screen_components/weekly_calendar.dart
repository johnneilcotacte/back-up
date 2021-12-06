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
          // Column(
          //   mainAxisAlignment: MainAxisAlignment.center,
          //   crossAxisAlignment: CrossAxisAlignment.center,
          //   children: [
          //     Text('29'),
          //     SizedBox(
          //       height: 15,
          //     ),
          //     Text(
          //       'Monday',
          //     )
          //   ],
          // ),
          _Date(
            date: '29',
            day: 'Monday',
          ),
          _Date(
            date: '30',
            day: 'Tuesday',
          ),
          _Date(
            date: '01',
            day: 'Wednesday',
          ),
          _Date(
            date: '02',
            day: 'Thursday',
          ),
          _Date(
            date: '03',
            day: 'Friday',
          ),
          _Date(
            date: '04',
            day: 'Saturday',
          ),
          _Date(
            date: '05',
            day: 'Sunday',
          ),
          // Column(
          //   mainAxisAlignment: MainAxisAlignment.center,
          //   crossAxisAlignment: CrossAxisAlignment.center,
          //   children: [
          //     Text('30'),
          //     SizedBox(
          //       height: 15,
          //     ),
          //     Text(
          //       'Tuesday',
          //     )
          //   ],
          // ),
          // Column(
          //   mainAxisAlignment: MainAxisAlignment.center,
          //   crossAxisAlignment: CrossAxisAlignment.center,
          //   children: [
          //     Text('1'),
          //     SizedBox(
          //       height: 15,
          //     ),
          //     Text(
          //       'Wednesday',
          //     )
          //   ],
          // ),
          // Column(
          //   mainAxisAlignment: MainAxisAlignment.center,
          //   crossAxisAlignment: CrossAxisAlignment.center,
          //   children: [
          //     Text('2'),
          //     SizedBox(
          //       height: 15,
          //     ),
          //     Text(
          //       'Thursday',
          //     )
          //   ],
          // ),
          // Column(
          //   mainAxisAlignment: MainAxisAlignment.center,
          //   crossAxisAlignment: CrossAxisAlignment.center,
          //   children: [
          //     Text(
          //       '3',
          //       style: TextStyle(color: Colors.blue),
          //     ),
          //     SizedBox(
          //       height: 15,
          //     ),
          //     Text('Friday', style: TextStyle(color: Colors.blue))
          //   ],
          // ),
          // Column(
          //   mainAxisAlignment: MainAxisAlignment.center,
          //   crossAxisAlignment: CrossAxisAlignment.center,
          //   children: [
          //     Text('4'),
          //     SizedBox(
          //       height: 15,
          //     ),
          //     Text(
          //       'Saturday',
          //     )
          //   ],
          // ),
          // Column(
          //   mainAxisAlignment: MainAxisAlignment.center,
          //   crossAxisAlignment: CrossAxisAlignment.center,
          //   children: [
          //     Text('5'),
          //     SizedBox(
          //       height: 15,
          //     ),
          //     Text(
          //       'Sunday',
          //     )
          //   ],
          // ),
        ],
      ),
    );
  }
}

class _Date extends StatelessWidget {
  final String date;
  final String day;
  const _Date({
    Key? key,
    required this.date,
    required this.day,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(date),
        SizedBox(
          height: 15,
        ),
        Text(
          day,
        )
      ],
    );
  }
}
