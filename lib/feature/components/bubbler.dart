import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:quizz/feature/domain/bubble.dart';

class Bubbler extends StatelessWidget {
  final Bubble bubble;

  const Bubbler({
    super.key,
    required this.bubble,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment(bubble.xPos, 0),
      child: Container(
        width: bubble.radius,
        height: bubble.radius,
        decoration: BoxDecoration(
          gradient: RadialGradient(
            center: Alignment.topCenter,
            radius: 1,
            colors: [Colors.transparent, Colors.white.withOpacity(.1)],
          ),
          borderRadius: BorderRadius.circular(50),
        ),
      )
          .animate()
          .fadeIn(duration: 700.milliseconds)
          .slide(end: const Offset(0, -35), duration: bubble.time.seconds)
          .shake(hz: bubble.hz),
    );
  }
}
