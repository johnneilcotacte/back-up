import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_miniproject/model/graph.dart';
import 'package:flutter_miniproject/module/home_screen_components/circular_graphs.dart';
import 'package:flutter_miniproject/module/home_screen_components/custom_drawer.dart';
import 'package:flutter_miniproject/module/home_screen_components/gradientbutton.dart';
import 'package:flutter_miniproject/module/home_screen_components/header.dart';
import 'package:flutter_miniproject/module/home_screen_components/meals_per_day.dart';
import 'package:flutter_miniproject/module/home_screen_components/weekly_calendar.dart';
import 'package:flutter_miniproject/module/home_screen_components/weekly_stats.dart';
import 'package:flutter_miniproject/responsive.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class HomePage extends HookWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Graph> _cal = [
      Graph(name: 'Cal', data: 75, color: Color.fromRGBO(235, 97, 143, 1)),
    ];
    List<Graph> _fats = [
      Graph(
        name: 'Fats',
        data: 60,
        color: Color.fromRGBO(145, 132, 202, 1),
      ),
    ];
    List<Graph> _carbs = [
      Graph(name: 'Carbs', data: 90, color: Color.fromRGBO(69, 187, 161, 1)),
    ];

    // List<Graph> _getChartData() {
    //   return [
    //     Graph(name: 'Cal', data: 75),
    //     Graph(name: 'Fats', data: 75),
    //     Graph(name: 'Carbs', data: 75),
    //   ];
    // }

    //  useEffect(
    //   () {
    //     _data = _getChartData();
    //     return;
    //   },
    //   [],
    // );
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
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
      ),
      body: Row(
        children: [
          CustomDrawer(),
          Expanded(
            child: Container(
              padding: EdgeInsets.only(left: 30, right: 30),
              color: Colors.white,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    height: 56,
                    color: Colors.white,
                  ),
                  Expanded(
                      child: ListView(
                    padding: EdgeInsets.zero,
                    children: [
                      ////////////////////////////////////////////////////////////////
                      Container(
                        height: 200,
                        // width: double.infinity,
                        //color: Colors.white,

                        child: Row(
                          children: [
                            Header(),
                            StatsCircularGraph(
                                cal: _cal, fats: _fats, carbs: _carbs),
                          ],
                        ),
                      ),

                      ////////////////////////////////////////////////////////////////////////////
                      Container(
                        height: 100,
                        child: Row(
                          children: [
                            Gradientbutton(),
                            WeeklyStats(),
                          ],
                        ),
                      ),

                      /////////////////////////////////////////////////////////////////////////////////////////////
                      WeeklyCalendar(),
                      //////////////////////////////////////////////////////////////////////////
                      MealsPerDay(),
                    ],
                  )),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
