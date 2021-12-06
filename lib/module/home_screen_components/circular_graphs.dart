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
          _CircularGraph(
            type: _cal,
            text: 'Cals',
          ),
          _CircularGraph(
            type: _fats,
            text: 'Fats',
          ),
          _CircularGraph(
            type: _carbs,
            text: 'Carbs',
          ),
        ]),
      ),
    );
  }
}

class _CircularGraph extends StatelessWidget {
  _CircularGraph({Key? key, required this.type, required this.text})
      : super(key: key);

  final List<Graph> type;
  final String text;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SfCircularChart(
        title: ChartTitle(
          text: text,
          alignment: ChartAlignment.center,
          textStyle: TextStyle(
            fontStyle: FontStyle.italic,
            fontSize: 14,
          ),
        ),
        series: <CircularSeries>[
          RadialBarSeries<Graph, String>(
            cornerStyle: CornerStyle.bothCurve,
            dataSource: type,
            xValueMapper: (Graph type, _) => type.name,
            yValueMapper: (Graph type, _) => type.data,
            maximumValue: 100,
            trackOpacity: .4,
            innerRadius: '70%',
            radius: '70%',
            pointColorMapper: (Graph type, _) => type.color,
            dataLabelSettings: DataLabelSettings(
                isVisible: true, labelPosition: ChartDataLabelPosition.outside),
          )
        ],
      ),
    );
  }
}
