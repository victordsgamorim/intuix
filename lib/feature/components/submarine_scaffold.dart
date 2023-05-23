import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:go_router/go_router.dart';
import 'package:nil/nil.dart';
import 'package:quizz/feature/components/bubbler.dart';
import 'package:quizz/feature/components/content_box.dart';
import 'package:quizz/feature/components/wave.dart';
import 'package:quizz/feature/domain/bubble.dart';
import 'package:quizz/main.dart';

class SubmarineScaffold extends StatefulWidget {
  final ContentBox Function(AnimationController controller)? content;
  final double contentY;
  final bool hasAppBar;

  const SubmarineScaffold({
    super.key,
    this.content,
    this.contentY = 0,
    this.hasAppBar = false,
  });

  @override
  State<SubmarineScaffold> createState() => _SubmarineScaffoldState();
}

class _SubmarineScaffoldState extends State<SubmarineScaffold>
    with SingleTickerProviderStateMixin {
  late final AnimationController _animationController =
      AnimationController(vsync: this);

  @override
  void initState() {
    super.initState();
    bubbleLogic
      ..generateBubbles()
      ..listen((bubbles) {
        if (bubbles.length > 30) {
          bubbles.removeRange(bubbles.length ~/ 2, bubbles.length - 1);
        }
      });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: widget.hasAppBar
          ? AppBar(
              leading: IconButton(
                onPressed: () {
                  _animationController.reverse().then((_) {
                    context.pop();
                  });
                },
                icon: const Icon(Icons.arrow_back_rounded),
              ),
            )
          : null,
      extendBodyBehindAppBar: true,
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                colorScheme.primaryContainer,
                colorScheme.primary,
              ],
            )),
          ),
          StreamBuilder<List<Bubble>>(
              stream: bubbleLogic.bubblesStream,
              builder: (_, snapshot) {
                if (!snapshot.hasData) return const SizedBox();
                final bubbles = snapshot.data!;
                return Stack(
                  children: bubbles
                      .map<Bubbler>((bubble) => Bubbler(bubble: bubble))
                      .toList(),
                );
              }),
          Wave.w2(
            width: size.width,
            height: size.height / 1.5,
            color: colorScheme.primaryContainer.withOpacity(0.2),
          )
              .animate(onPlay: (controller) => controller.repeat())
              .slideX(delay: 3.seconds, duration: 36.seconds, end: -2),
          Wave.w1(
            width: size.width,
            height: size.height,
            color: Colors.white.withOpacity(.03),
          )
              .animate(onPlay: (controller) => controller.repeat())
              .slideX(duration: 1.minutes, end: -2),
          Wave.w2(
            width: size.width,
            height: size.height,
            color: colorScheme.primaryContainer.withOpacity(0.3),
          )
              .animate(onPlay: (controller) => controller.repeat())
              .slideX(duration: 25.seconds, end: -2),
          Visibility(
            visible: widget.content != null,
            child: Align(
              alignment: Alignment(0, widget.contentY),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: (widget.content != null
                        ? widget.content!(_animationController)
                        : nil)
                    .animate(controller: _animationController)
                    .scaleY(duration: 500.milliseconds, curve: Curves.easeInOut)
                    .fadeIn(),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    // bubbleLogic.dispose();
    super.dispose();
  }
}
