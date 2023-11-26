// import 'package:flutter/material.dart';
// import 'package:fl_chart/fl_chart.dart';


// import 'package:flutter/material.dart';

// class DrawLines extends StatefulWidget {
//   final Coordinates lineCoordinates;
//   final double yHeight;

//   DrawLines({required this.lineCoordinates, required this.yHeight});

//   @override
//   _DrawLinesState createState() => _DrawLinesState();
// }

// class _DrawLinesState extends State<DrawLines> {
//   @override
//   Widget build(BuildContext context) {
//     return CustomPaint(
//       foregroundPainter: LinePainter(
//         coordinates: widget.lineCoordinates,
//         yHeight: widget.yHeight,
//       ),
//     );
//   }
// }

// class CoordValues {
//   late double x;
//   late double y;

//   CoordValues({required this.x, required this.y});
// }

// class Coordinates {
//   late CoordValues startCoords;
//   late CoordValues endCoords;

//   Coordinates({required this.startCoords, required this.endCoords});
// }

// class LinePainter extends CustomPainter {
//   late Coordinates coordinates;
//   late double yHeight;

//   LinePainter({required this.coordinates, required this.yHeight});

//   @override
//   void paint(Canvas canvas, Size size) {
//     final paint = Paint()
//       ..color = Color(0xFF295AE3)
//       ..strokeCap = StrokeCap.round
//       ..strokeWidth = 2;

//     // curved line
//     Path path = Path();
//     path.moveTo(coordinates.startCoords.x, yHeight - coordinates.startCoords.y);
//     path.quadraticBezierTo(
//       coordinates.startCoords.x + 15,
//       coordinates.startCoords.y,
//       coordinates.endCoords.x + 15,
//       yHeight - coordinates.endCoords.y,
//     );

//     // drawPath curve
//     final drawPathResult = drawPath(size.width, yHeight);
//     path.addPath(drawPathResult, Offset(0, 0));

//     canvas.drawPath(path, paint);
//   }

//   @override
//   bool shouldRepaint(CustomPainter oldDelegate) => false;

//   Path drawPath(double width, double height) {
//     final path = Path();
//     final segmentWidth = width / 3 / 2;
//     path.moveTo(0, height);
//     path.cubicTo(segmentWidth, height, 2 * segmentWidth, 0, 3 * segmentWidth, 0);
//     path.cubicTo(4 * segmentWidth, 0, 5 * segmentWidth, height, 6 * segmentWidth, height);

//     return path;
//   }
// }

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