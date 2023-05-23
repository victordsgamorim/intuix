import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:quizz/gen/assets.gen.dart';

class GrainShading extends StatelessWidget {
  final Color color;
  final double opacity;

  const GrainShading({super.key, required this.color, this.opacity = .2});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Opacity(
        opacity: opacity,
        child: SvgPicture.asset(
          Assets.images.textures.grany,
          colorFilter: ColorFilter.mode(
            color,
            BlendMode.modulate,
          ),
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}
