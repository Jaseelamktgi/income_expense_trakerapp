import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';


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
//           coordinates: widget.lineCoordinates, yHeight: widget.yHeight),
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

//     //curved
//     Path path = Path();

//     path.moveTo(coordinates.startCoords.x, yHeight - coordinates.startCoords.y);
//     path.quadraticBezierTo(
//         coordinates.startCoords.x + 15,
//         coordinates.startCoords.y,
//         coordinates.endCoords.x + 15,
//         yHeight - coordinates.endCoords.y);
//     //for every two points one line is drawn

  

//     canvas.drawPath(path, paint);
//   }

//   @override
//   bool shouldRepaint(CustomPainter oldDelegate) => false;
// }

import 'package:flutter/material.dart';

class DrawLines extends StatefulWidget {
  final Coordinates lineCoordinates;
  final double yHeight;

  DrawLines({required this.lineCoordinates, required this.yHeight});

  @override
  _DrawLinesState createState() => _DrawLinesState();
}

class _DrawLinesState extends State<DrawLines> {
  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      foregroundPainter: LinePainter(
        coordinates: widget.lineCoordinates,
        yHeight: widget.yHeight,
      ),
    );
  }
}

class CoordValues {
  late double x;
  late double y;

  CoordValues({required this.x, required this.y});
}

class Coordinates {
  late CoordValues startCoords;
  late CoordValues endCoords;

  Coordinates({required this.startCoords, required this.endCoords});
}

class LinePainter extends CustomPainter {
  late Coordinates coordinates;
  late double yHeight;

  LinePainter({required this.coordinates, required this.yHeight});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Color(0xFF295AE3)
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 2;

    // curved line
    Path path = Path();
    path.moveTo(coordinates.startCoords.x, yHeight - coordinates.startCoords.y);
    path.quadraticBezierTo(
      coordinates.startCoords.x + 15,
      coordinates.startCoords.y,
      coordinates.endCoords.x + 15,
      yHeight - coordinates.endCoords.y,
    );

    // drawPath curve
    final drawPathResult = drawPath(size.width, yHeight);
    path.addPath(drawPathResult, Offset(0, 0));

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;

  Path drawPath(double width, double height) {
    final path = Path();
    final segmentWidth = width / 3 / 2;
    path.moveTo(0, height);
    path.cubicTo(segmentWidth, height, 2 * segmentWidth, 0, 3 * segmentWidth, 0);
    path.cubicTo(4 * segmentWidth, 0, 5 * segmentWidth, height, 6 * segmentWidth, height);

    return path;
  }
}
