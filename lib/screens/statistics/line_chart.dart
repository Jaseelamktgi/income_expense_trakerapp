import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class ReportPage extends StatelessWidget {
  ReportPage({super.key});
  final List<ChartData> incomeData = [
    ChartData(1, 2000),
    ChartData(2, 2200),
    ChartData(3, 2400),
    ChartData(4, 2300),
    ChartData(5, 2500),
    ChartData(6, 2500),
  ];

  final List<ChartData> expenseData = [
    ChartData(1, 800),
    ChartData(2, 1000),
    ChartData(3, 1200),
    ChartData(4, 1100),
    ChartData(5, 1300),
    ChartData(6, 1300),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: SfCartesianChart(
            primaryXAxis: NumericAxis(
              title: AxisTitle(text: 'month'),
            ),
            primaryYAxis: NumericAxis(
              title: AxisTitle(text: 'Amount (USD)'),
            ),
            series: <ChartSeries<ChartData, num>>[
              LineSeries<ChartData, num>(
                dataSource: incomeData,
                xValueMapper: (ChartData data, _) => data.x,
                yValueMapper: (ChartData data, _) => data.y,
                name: 'Income',
              ),
              LineSeries<ChartData, num>(
                dataSource: expenseData,
                xValueMapper: (ChartData data, _) => data.x,
                yValueMapper: (ChartData data, _) => data.y,
                name: 'Expense',
              ),
            ],
            legend: const Legend(
              isVisible: true,
            ),
          ),
        ),
      ),
    );
  }
}

class ChartData {
  final num x;
  final num y;

  ChartData(this.x,this.y);
}