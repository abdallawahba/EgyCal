import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class CaloriesLineChart extends StatelessWidget{
  final Map<double, double> data;
  const CaloriesLineChart({super.key, required this.data});
  double get minimumWeight => data.values.reduce((a, b) => a < b ? a : b);
  List<FlSpot> dots() {
    return data.entries.map((e) => FlSpot(e.key, e.value)).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 328,
      height: 207,
      decoration: BoxDecoration(
        color: Color(0xfff7f7f7),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.only(top:15,right:25,left:10,bottom: 15),
        child: LineChart(
          LineChartData(
            minY: 900,
            maxY: 2250,
            minX: 11,
            maxX: 17,
            titlesData: FlTitlesData(
              bottomTitles: AxisTitles(
                sideTitles: SideTitles(
                  showTitles: true,
                  interval: 1,
                  reservedSize: 32,
                ),
              ),
              leftTitles: AxisTitles(
                sideTitles: SideTitles(
                  showTitles: true,
                  interval: 250,
                  getTitlesWidget: (value, meta) {
                    if (value == minimumWeight-100) return SizedBox.shrink();
                    return Text(value.toInt().toString());
                  },
                  reservedSize: 40,
                ),
              ),
              topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
              rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
            ),
            gridData: FlGridData(show: false),
            borderData: FlBorderData(show: false),
            lineBarsData: [
              LineChartBarData(
                isCurved: true,
                color: Color(0xff35cc8d),
                barWidth: 3,
                spots: dots(),
                dotData: FlDotData(show: false),
              ),
            ],
          ),
        ),
      ),
    );
  }
}