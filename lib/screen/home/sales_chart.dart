

import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class SalesChart extends StatefulWidget {
  const SalesChart({super.key});

  @override
  State<SalesChart> createState() => _SalesChartState();
}

class _SalesChartState extends State<SalesChart> {
  late List<_ChartData> data;
  late TooltipBehavior _tooltip;
  @override
  void initState() {
    data = [
      _ChartData('Jan', 12),
      _ChartData('Feb', 15),
      _ChartData('Mar', 30),
      _ChartData('Apr', 6.4),
      _ChartData('May', 14)
    ];
    _tooltip = TooltipBehavior(enable: true);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

        body: SfCartesianChart(
            primaryXAxis: CategoryAxis(),
            primaryYAxis: NumericAxis(minimum: 0, maximum: 50, interval: 5),
            tooltipBehavior: _tooltip,
            series: <ChartSeries<_ChartData, String>>[
              ColumnSeries<_ChartData, String>(
                  dataSource: data,
                  xValueMapper: (_ChartData data, _) => data.x,
                  yValueMapper: (_ChartData data, _) => data.y,
                  name: 'Gold',
                  color: Color.fromRGBO(8, 142, 255, 1))
            ]));
  }
}



class _ChartData {
  _ChartData(this.x, this.y);
  final String x;
  final double y;
}












// import 'package:c2b_vendor/screen/home/pricePoints.dart';
// import 'package:fl_chart/fl_chart.dart';
// import 'package:flutter/material.dart';
//
//
// class BarChartWidget extends StatefulWidget {
//   const BarChartWidget({Key? key, required this.points}) : super(key: key);
//
//   final List<PricePoint> points;
//
//   @override
//   State<BarChartWidget> createState() => _BarChartWidgetState(points: this.points);
// }
//
// class _BarChartWidgetState extends State<BarChartWidget> {
//   final List<PricePoint> points;
//
//   _BarChartWidgetState({required this.points});
//
//   @override
//   Widget build(BuildContext context) {
//     return AspectRatio(
//       aspectRatio: 1,
//       child: BarChart(
//         BarChartData(
//           barGroups: _chartGroups(),
//           borderData: FlBorderData(
//               border: const Border(bottom: BorderSide(), left: BorderSide())),
//           gridData: FlGridData(show: false),
//           titlesData: FlTitlesData(
//             bottomTitles: AxisTitles(sideTitles: _bottomTitles),
//             leftTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
//             topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
//             rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
//           ),
//         ),
//       ),
//     );
//   }
//
//   List<BarChartGroupData> _chartGroups() {
//     return points.map((point) =>
//         BarChartGroupData(
//             x: point.x.toInt(),
//             barRods: [
//               BarChartRodData(
//                   toY: point.y
//               )
//             ]
//         )
//
//     ).toList();
//   }
//
//   SideTitles get _bottomTitles => SideTitles(
//     showTitles: true,
//     getTitlesWidget: (value, meta) {
//       String text = '';
//       switch (value.toInt()) {
//         case 0:
//           text = 'Jan';
//           break;
//         case 2:
//           text = 'Mar';
//           break;
//         case 4:
//           text = 'May';
//           break;
//         case 6:
//           text = 'Jul';
//           break;
//         case 8:
//           text = 'Sep';
//           break;
//         case 10:
//           text = 'Nov';
//           break;
//       }
//
//       return Text(text);
//     },
//   );
// }