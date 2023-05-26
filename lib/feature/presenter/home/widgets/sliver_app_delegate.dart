import 'package:quizz/core/utils/constants/app_style.dart';
import 'package:quizz/feature/components/grain_shading.dart';
import 'package:quizz/feature/presenter/common_libs.dart';
import 'package:quizz/feature/presenter/home/widgets/rounded_container.dart';

class SliverAppDelegate extends SliverPersistentHeaderDelegate {
  final BuildContext context;

  SliverAppDelegate(this.context);

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    final double percent = shrinkOffset / maxExtent;
    return LayoutBuilder(builder: (context, constraints) {
      final realHeight =
          constraints.maxHeight - MediaQuery.of(context).viewPadding.top;
      final double radius = (realHeight * .7).clamp(80, 160);
      final double opacity = (1 - percent * 1.5).clamp(0, 1);
      return Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 25.0),
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30)),
              child: Container(
                decoration: BoxDecoration(
                  gradient: AppStyle.containerGradient(context),
                ),
                child: GrainShading(
                    color: Theme.of(context).colorScheme.secondaryContainer),
              ),
            ),
          ),
          Align(
            alignment: Alignment(-.85 * (percent * 2).clamp(0, 1), -1),
            child: SafeArea(
                child: SizedBox(
              width: constraints.maxWidth * .6 - percent,
              height: 100,
              child: Column(
                children: [
                  Expanded(
                    child: FittedBox(
                      fit: BoxFit.fitWidth,
                      alignment: Alignment.topCenter,
                      child: Text(
                        'Victor Amorim',
                        style: TextStyle(
                            color: Theme.of(context)
                                .colorScheme
                                .onSecondaryContainer),
                      ),
                    ),
                  ),
                  Visibility(
                    visible: opacity > .5,
                    child: Opacity(
                      opacity: opacity,
                      child: LayoutBuilder(builder: (context, constraints) {
                        const double padding = 8;
                        final double width = constraints.maxWidth - padding;
                        return Container(
                          color: Colors.red,
                          child: Row(
                            children: [
                              Container(
                                width: width * .8,
                                height: 15,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50),
                                  color:
                                      Theme.of(context).colorScheme.onSecondary,
                                ),
                                alignment: Alignment.centerLeft,
                                child: LayoutBuilder(builder: (context, c) {
                                  return Container(
                                    height: c.maxHeight,
                                    width: c.maxWidth * .3,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(50),
                                        gradient: LinearGradient(
                                          colors: [
                                            Theme.of(context)
                                                .colorScheme
                                                .secondary,
                                            Theme.of(context)
                                                .colorScheme
                                                .onSecondaryContainer,
                                          ],
                                        )),
                                  );
                                }),
                              ),
                              const SizedBox(width: padding),
                              Container(
                                width: width * .2,
                                color: Colors.yellow,
                                child: RichText(
                                  text: const TextSpan(
                                    text: 'Lv.\n',
                                    children: [TextSpan(text: '1233')],
                                  ),
                                ),
                              )
                            ],
                          ),
                        );
                      }),
                    ),
                  )
                ],
              ),
            )),
          ),
          Align(
              alignment: Alignment(.9 * (percent * 2).clamp(0, 1), 1),
              child: RoundedContainer.shadow(
                radius: radius,
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: RoundedContainer(
                    radius: radius,
                    color: Theme.of(context).colorScheme.primaryContainer,
                  ),
                ),
              ))
        ],
      );
    });
  }

  @override
  double get maxExtent => MediaQuery.of(context).viewPadding.top + 250;

  @override
  double get minExtent =>
      MediaQuery.of(context).viewPadding.top + kToolbarHeight + 20;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) =>
      false;
}
