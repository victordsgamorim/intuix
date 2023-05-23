import 'package:flutter/material.dart';

class Wave extends StatelessWidget {
  final double? width;
  final double? height;
  final Color? color;
  final CustomPainter? painter;

  const Wave({
    Key? key,
    this.width,
    this.height,
    this.color,
    this.painter,
  }) : super(key: key);

  factory Wave.w1({double? width, double? height, required Color color}) {
    return Wave(
      width: width,
      height: height,
      color: color,
      painter: _WavePainter.w1(color: color),
    );
  }

  factory Wave.w2({double? width, double? height, required Color color}) {
    return Wave(
      width: width,
      height: height,
      color: color,
      painter: _WavePainter.w2(color: color),
    );
  }

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: painter,
      size: Size(
        width ?? MediaQuery.of(context).size.width,
        height ?? MediaQuery.of(context).size.height,
      ),
    );
  }
}

class _WavePainter extends CustomPainter {
  final Color color;
  final Path Function(Size size) path;

  _WavePainter({
    required this.color,
    required this.path,
  });

  factory _WavePainter.w1({required Color color}) {
    const double centerHeight = .2;
    return _WavePainter(
        color: color,
        path: (size) => Path()
          ..moveTo(0, size.height)
          ..lineTo(0, size.height * centerHeight)
          ..quadraticBezierTo(
            size.width * .25,
            size.height * -.05,
            size.width * .5,
            size.height * centerHeight,
          )
          ..quadraticBezierTo(
            size.width * .75,
            size.height * .45,
            size.width * 1,
            size.height * centerHeight,
          )
          ..quadraticBezierTo(
            size.width * 1.25,
            size.height * 0,
            size.width * 1.5,
            size.height * centerHeight,
          )
          ..quadraticBezierTo(
            size.width * 1.75,
            size.height * .4,
            size.width * 2,
            size.height * centerHeight,
          )
          ..quadraticBezierTo(
            size.width * 2.25,
            size.height * -.05,
            size.width * 2.5,
            size.height * centerHeight,
          )
          ..quadraticBezierTo(
            size.width * 2.75,
            size.height * .45,
            size.width * 3,
            size.height * centerHeight,
          )
          ..lineTo(size.width * 3, size.height));
  }

  factory _WavePainter.w2({required Color color}) {
    const double centerHeight = .2;
    return _WavePainter(
        color: color,
        path: (size) => Path()
          ..moveTo(0, size.height)
          ..lineTo(0, size.height * centerHeight)
          ..quadraticBezierTo(
            size.width * .25,
            size.height * .3,
            size.width * .5,
            size.height * centerHeight,
          )
          ..quadraticBezierTo(
            size.width * .75,
            size.height * .1,
            size.width,
            size.height * centerHeight,
          )
          ..quadraticBezierTo(
            size.width * 1.4,
            size.height * .4,
            size.width * 1.65,
            size.height * centerHeight,
          )
          ..quadraticBezierTo(
            size.width * 1.8,
            size.height * .1,
            size.width * 2,
            size.height * centerHeight,
          )
          ..quadraticBezierTo(
            size.width * 2.25,
            size.height * .3,
            size.width * 2.5,
            size.height * centerHeight,
          )
          ..quadraticBezierTo(
            size.width * 2.75,
            size.height * .1,
            size.width * 3,
            size.height * centerHeight,
          )
          ..lineTo(size.width * 3, size.height));
  }

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..shader = LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        stops: const [0.25, .65],
        colors: [color, Colors.transparent],
      ).createShader(Rect.fromLTWH(0, 0, size.width, size.height * .9));
    canvas.drawPath(path(size), paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
