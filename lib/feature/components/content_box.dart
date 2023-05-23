import 'package:flutter/material.dart';
import 'package:nil/nil.dart';
import 'package:quizz/feature/components/grain_shading.dart';
import 'package:quizz/gen/fonts.gen.dart';

const double _fontSize = 56.0;
const double _topPadding = 60.0;

class ContentBox extends StatelessWidget {
  final double maxWidth;
  final double maxHeight;
  final double height;
  final String title;
  final double titleFontSize;
  final Function(BoxConstraints constaints) builder;
  final Widget? bottom;

  const ContentBox({
    super.key,
    this.maxWidth = 600,
    this.maxHeight = 600,
    required this.height,
    required this.title,
    required this.builder,
    this.titleFontSize = 56,
    this.bottom,
  });

  factory ContentBox.allIn({
    Key? key,
    double maxWidth = 600,
    double maxHeight = 600,
    required double height,
    required String title,
    required Function(BoxConstraints constaints) builder,
    required Widget bottom,
    double titleFontSize = 56,
  }) {
    return ContentBox(
      key: key,
      maxWidth: maxWidth,
      maxHeight: maxHeight,
      height: height,
      title: title,
      builder: builder,
      titleFontSize: titleFontSize,
      bottom: bottom,
    );
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    final padding = titleFontSize < _fontSize
        ? _topPadding - (_fontSize - titleFontSize)
        : _topPadding;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        _Box(
          maxWidth: maxWidth,
          maxHeight: maxHeight,
          height: height,
          title: title,
          titleFontSize: titleFontSize,
          builder: builder,
          padding: padding,
          color: colorScheme,
        ),
        Visibility(
          visible: bottom != null,
          child: bottom != null
              ? Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: SizedBox(
                    width: double.infinity,
                    child: bottom,
                  ),
                )
              : nil,
        ),
      ],
    );
  }
}

class _Box extends StatelessWidget {
  final double maxWidth;
  final double maxHeight;
  final double height;
  final String title;
  final double titleFontSize;
  final Function(BoxConstraints constaints) builder;
  final double padding;
  final ColorScheme color;

  const _Box({
    required this.maxWidth,
    required this.maxHeight,
    required this.height,
    required this.title,
    required this.titleFontSize,
    required this.builder,
    required this.padding,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(maxWidth: maxWidth, maxHeight: maxHeight),
      child: Stack(
        children: [
          Padding(
            padding: EdgeInsets.only(top: padding),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(24),
              child: Container(
                height: height,
                decoration: BoxDecoration(
                  color: color.secondary,
                  boxShadow: [
                    BoxShadow(
                        offset: const Offset(0, 5),
                        spreadRadius: 2,
                        blurRadius: 8,
                        color: Theme.of(context)
                            .colorScheme
                            .onPrimaryContainer
                            .withOpacity(.4))
                  ],
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      stops: const [0.25, .65],
                      colors: [color.secondaryContainer, color.secondary]),
                ),
                child: Stack(
                  children: [
                    GrainShading(
                      color: color.secondaryContainer,
                      opacity: .1,
                    ),
                    LayoutBuilder(
                      builder: (_, constraints) {
                        return SizedBox(
                          width: constraints.maxWidth,
                          height: constraints.maxHeight,
                          child: FractionallySizedBox(
                            widthFactor: .9,
                            child: builder(constraints),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
          _PageTitle(title: title, fontSize: titleFontSize),
        ],
      ),
    );
  }
}

class _PageTitle extends StatelessWidget {
  final String title;
  final double fontSize;

  const _PageTitle({Key? key, required this.title, required this.fontSize})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      textScaleFactor: 1,
      style: TextStyle(
        fontFamily: FontFamily.lobsterTwo,
        fontWeight: FontWeight.w700,
        color: Colors.white,
        fontSize: fontSize,
        shadows: const [
          Shadow(
            offset: Offset(0, 1),
            color: Colors.black38,
            blurRadius: 6,
          )
        ],
      ),
    );
  }
}
