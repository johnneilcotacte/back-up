import 'package:flutter/material.dart';
import 'package:flutter_miniproject/model/graph.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class StatsCircularGraph extends StatelessWidget {
  const StatsCircularGraph({
    Key? key,
    required List<Graph> cal,
    required List<Graph> fats,
    required List<Graph> carbs,
  })  : _cal = cal,
        _fats = fats,
        _carbs = carbs,
        super(key: key);

  final List<Graph> _cal;
  final List<Graph> _fats;
  final List<Graph> _carbs;

  @override
  Widget build(BuildContext context) {
    return Flexible(
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
        child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
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
                  cornerStyle: CornerStyle.bothCurve,
                  dataSource: _cal,
                  xValueMapper: (Graph _cal, _) => _cal.name,
                  yValueMapper: (Graph _cal, _) => _cal.data,
                  maximumValue: 100,
                  trackOpacity: .4,
                  innerRadius: '70%',
                  radius: '70%',
                  pointColorMapper: (Graph _cals, _) => _cals.color,
                  dataLabelSettings: DataLabelSettings(
                      isVisible: true,
                      labelPosition: ChartDataLabelPosition.outside),
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
                  cornerStyle: CornerStyle.bothCurve,
                  dataSource: _fats,
                  xValueMapper: (Graph _fats, _) => _fats.name,
                  yValueMapper: (Graph _fats, _) => _fats.data,
                  maximumValue: 100,
                  trackOpacity: .4,
                  innerRadius: '70%',
                  radius: '70%',
                  pointColorMapper: (Graph _fats, _) => _fats.color,
                  dataLabelSettings: DataLabelSettings(
                      isVisible: true,
                      labelPosition: ChartDataLabelPosition.outside),
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
                  cornerStyle: CornerStyle.bothCurve,
                  dataSource: _carbs,
                  xValueMapper: (Graph _carbs, _) => _carbs.name,
                  yValueMapper: (Graph _carbs, _) => _carbs.data,
                  maximumValue: 100,
                  pointColorMapper: (Graph _carbs, _) => _carbs.color,
                  dataLabelSettings: DataLabelSettings(
                      isVisible: true,
                      labelPosition: ChartDataLabelPosition.outside),
                )
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
