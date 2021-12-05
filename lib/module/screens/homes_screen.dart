import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_miniproject/model/graph.dart';
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
          Container(
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
          ),
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
                            Flexible(
                              //wrap this with flexible if inside a column or row
                              /* child: FractionallySizedBox(
                                //para naay standard sizes parehas sa mediaquery * .4
                                widthFactor: 0.4,
                                child: Container(
                                  color: Colors.red,
                                ),
                              ),*/
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
                                      style: TextStyle(
                                          color: Colors.black, fontSize: 35),
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
                            ),
                            Flexible(
                              fit: FlexFit.tight,
                              flex: 5,
                              //wrap this with flexible if inside a column or row
                              child: Container(
                                decoration: BoxDecoration(
                                    border: Border(
                                      bottom: BorderSide(width: 0.3),
                                      top: BorderSide(width: 0.3),
                                    ),
                                    color: Colors.white),
                                child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      //https://help.syncfusion.com/flutter/circular-charts/chart-types/radial-bar-chart
                                      Expanded(
                                        child: SfCircularChart(
                                          title: ChartTitle(
                                            text: 'Cals',
                                            alignment: ChartAlignment.center,
                                            textStyle: TextStyle(
                                              fontStyle: FontStyle.italic,
                                              fontSize: 14,
                                            ),
                                          ),
                                          series: <CircularSeries>[
                                            RadialBarSeries<Graph, String>(
                                              cornerStyle:
                                                  CornerStyle.bothCurve,
                                              dataSource: _cal,
                                              xValueMapper: (Graph _cal, _) =>
                                                  _cal.name,
                                              yValueMapper: (Graph _cal, _) =>
                                                  _cal.data,
                                              maximumValue: 100,
                                              trackOpacity: .4,
                                              innerRadius: '70%',
                                              radius: '70%',
                                              pointColorMapper:
                                                  (Graph _cals, _) =>
                                                      _cals.color,
                                              dataLabelSettings:
                                                  DataLabelSettings(
                                                      isVisible: true,
                                                      labelPosition:
                                                          ChartDataLabelPosition
                                                              .outside),
                                            )
                                          ],
                                        ),
                                      ),
                                      Expanded(
                                        child: SfCircularChart(
                                          title: ChartTitle(
                                            text: 'Fats',
                                            alignment: ChartAlignment.center,
                                            textStyle: TextStyle(
                                              fontStyle: FontStyle.italic,
                                              fontSize: 14,
                                            ),
                                          ),
                                          series: <CircularSeries>[
                                            RadialBarSeries<Graph, String>(
                                              cornerStyle:
                                                  CornerStyle.bothCurve,
                                              dataSource: _fats,
                                              xValueMapper: (Graph _fats, _) =>
                                                  _fats.name,
                                              yValueMapper: (Graph _fats, _) =>
                                                  _fats.data,
                                              maximumValue: 100,
                                              trackOpacity: .4,
                                              innerRadius: '70%',
                                              radius: '70%',
                                              pointColorMapper:
                                                  (Graph _fats, _) =>
                                                      _fats.color,
                                              dataLabelSettings:
                                                  DataLabelSettings(
                                                      isVisible: true,
                                                      labelPosition:
                                                          ChartDataLabelPosition
                                                              .outside),
                                            )
                                          ],
                                        ),
                                      ),
                                      Expanded(
                                        child: SfCircularChart(
                                          title: ChartTitle(
                                            text: 'Carbs',
                                            alignment: ChartAlignment.center,
                                            textStyle: TextStyle(
                                              fontStyle: FontStyle.italic,
                                              fontSize: 14,
                                            ),
                                          ),
                                          series: <CircularSeries>[
                                            RadialBarSeries<Graph, String>(
                                              trackOpacity: .4,
                                              innerRadius: '70%',
                                              radius: '70%',
                                              cornerStyle:
                                                  CornerStyle.bothCurve,
                                              dataSource: _carbs,
                                              xValueMapper: (Graph _carbs, _) =>
                                                  _carbs.name,
                                              yValueMapper: (Graph _carbs, _) =>
                                                  _carbs.data,
                                              maximumValue: 100,
                                              pointColorMapper:
                                                  (Graph _carbs, _) =>
                                                      _carbs.color,
                                              dataLabelSettings:
                                                  DataLabelSettings(
                                                      isVisible: true,
                                                      labelPosition:
                                                          ChartDataLabelPosition
                                                              .outside),
                                            )
                                          ],
                                        ),
                                      ),
                                    ]),
                              ),
                            ),
                          ],
                        ),
                      ),

                      ////////////////////////////////////////////////////////////////////////////
                      Container(
                        height: 100,
                        child: Row(
                          children: [
                            Flexible(
                              flex: 3,
                              fit: FlexFit.tight,
                              child: Container(
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    colors: [
                                      Colors.lightBlue.shade800,
                                      Colors.lightBlue.shade300
                                    ],
                                  ),
                                ),
                                padding: EdgeInsets.only(left: 10, right: 10),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Flexible(
                                        fit: FlexFit.tight,
                                        flex: 5,
                                        //wrap this with flexible if inside a column or row
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              'Current Week',
                                              style: TextStyle(
                                                  color: Colors.white),
                                            ),
                                            SizedBox(
                                              height: 20,
                                            ),
                                            Text(
                                              'Friday, Dec 3',
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 20),
                                            ),
                                          ],
                                        )),
                                    Flexible(
                                        fit: FlexFit.tight,
                                        flex: 5,
                                        //wrap this with flexible if inside a column or row
                                        child: Align(
                                          alignment: Alignment.center,
                                          child: Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              IconButton(
                                                onPressed: () {},
                                                icon: FaIcon(
                                                  FontAwesomeIcons.chevronLeft,
                                                  size: 18,
                                                  color: Colors.white,
                                                ),
                                              ),
                                              IconButton(
                                                onPressed: () {},
                                                icon: FaIcon(
                                                  FontAwesomeIcons.chevronRight,
                                                  size: 18,
                                                  color: Colors.white,
                                                ),
                                              )
                                            ],
                                          ),
                                        )),
                                  ],
                                ),
                              ),
                            ),
                            Flexible(
                              fit: FlexFit.tight,
                              flex: 5,
                              //wrap this with flexible if inside a column or row
                              child: Container(
                                padding: EdgeInsets.only(left: 20, right: 20),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text('Goals'),
                                        SizedBox(
                                          height: 15,
                                        ),
                                        Text(
                                          'This Week',
                                          style: TextStyle(
                                            color: Colors.cyan,
                                          ),
                                        )
                                      ],
                                    ),
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text('Calories'),
                                        SizedBox(
                                          height: 15,
                                        ),
                                        Text(
                                          '14k',
                                          style: TextStyle(
                                            color: Colors.green,
                                          ),
                                        )
                                      ],
                                    ),
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text('Carbs'),
                                        SizedBox(
                                          height: 15,
                                        ),
                                        Text(
                                          '1540',
                                          style: TextStyle(
                                            color: Colors.purple,
                                          ),
                                        )
                                      ],
                                    ),
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text('Fats'),
                                        SizedBox(
                                          height: 15,
                                        ),
                                        Text(
                                          '600',
                                          style: TextStyle(
                                            color: Colors.pink,
                                          ),
                                        )
                                      ],
                                    ),
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text('Protien'),
                                        SizedBox(
                                          height: 15,
                                        ),
                                        Text(
                                          '1250',
                                          style: TextStyle(
                                            color: Colors.blue,
                                          ),
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),

                      /////////////////////////////////////////////////////////////////////////////////////////////
                      Container(
                        height: 100,
                        decoration: BoxDecoration(
                            border: Border.all(width: 0.3),
                            color: Colors.white),
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
                                Text('Friday',
                                    style: TextStyle(color: Colors.blue))
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
                      ),
                      //////////////////////////////////////////////////////////////////////////
                      Container(
                        height: 500,
                        child: GridView.count(
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 10,
                          crossAxisCount:
                              (Responsive.isDesktop(context)) ? 3 : 1,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage(
                                      'assets/images/hotdog.png',
                                    ),
                                    colorFilter: new ColorFilter.mode(
                                        Colors.black.withOpacity(0.8),
                                        BlendMode.dstATop),
                                    fit: BoxFit.cover),
                              ),
                              child: Container(
                                padding: EdgeInsets.all(10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Text(
                                      'Breakfast',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 20,
                                          fontStyle: FontStyle.italic),
                                    ),
                                    Text(
                                      'Hotdog',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 40,
                                          fontStyle: FontStyle.italic),
                                    ),
                                    ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        primary: Colors.white, // background
                                        //onPrimary: Colors.white, // foreground
                                      ),
                                      onPressed: () {},
                                      child: Text(
                                        'Eat Out',
                                        style: TextStyle(color: Colors.black),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage(
                                      'assets/images/lechon.jpg',
                                    ),
                                    colorFilter: new ColorFilter.mode(
                                        Colors.black.withOpacity(0.8),
                                        BlendMode.dstATop),
                                    fit: BoxFit.cover),
                              ),
                              child: Container(
                                padding: EdgeInsets.all(10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Text(
                                      'Lunch',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 20,
                                          fontStyle: FontStyle.italic),
                                    ),
                                    Text(
                                      'Crispy Lechon',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 40,
                                          fontStyle: FontStyle.italic),
                                    ),
                                    ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        primary: Colors.white, // background
                                        //onPrimary: Colors.white, // foreground
                                      ),
                                      onPressed: () {},
                                      child: Text(
                                        'Eat Out',
                                        style: TextStyle(color: Colors.black),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage(
                                      'assets/images/paksiw.jpg',
                                    ),
                                    colorFilter: new ColorFilter.mode(
                                        Colors.black.withOpacity(0.8),
                                        BlendMode.dstATop),
                                    fit: BoxFit.cover),
                              ),
                              child: Container(
                                padding: EdgeInsets.all(10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Text(
                                      'Dinner',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 20,
                                          fontStyle: FontStyle.italic),
                                    ),
                                    Text(
                                      'Spicy Lechon Paksiw',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 40,
                                          fontStyle: FontStyle.italic),
                                    ),
                                    ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        primary: Colors.white, // background
                                        //onPrimary: Colors.white, // foreground
                                      ),
                                      onPressed: () {},
                                      child: Text(
                                        'Eat Out',
                                        style: TextStyle(color: Colors.black),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
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
