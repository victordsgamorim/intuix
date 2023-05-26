import 'package:flutter/material.dart';

class RoundedContainer extends StatelessWidget {
  final double radius;
  final List<BoxShadow>? boxShadow;
  final Widget? child;
  final Color color;

  const RoundedContainer({
    super.key,
    required this.radius,
    this.boxShadow,
    this.child,
    this.color = Colors.white,
  });

  factory RoundedContainer.shadow(
      {required double radius, Widget? child, Color color = Colors.white}) {
    return RoundedContainer(
      radius: radius,
      color: color,
      boxShadow: const [
        BoxShadow(
          color: Colors.black38,
          offset: Offset(0, 3),
          blurRadius: 5,
          spreadRadius: 1,
        )
      ],
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: radius,
      width: radius,
      decoration: BoxDecoration(
        color: color,
        borderRadius: const BorderRadius.all(Radius.circular(150)),
        boxShadow: boxShadow,
      ),
      child: child,
    );
  }
}
