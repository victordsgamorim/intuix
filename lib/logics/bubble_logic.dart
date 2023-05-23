import 'dart:async';
import 'dart:math';

import 'package:quizz/feature/domain/bubble.dart';
import 'package:quizz/feature/presenter/common_libs.dart';
import 'package:rxdart/subjects.dart';

class BubbleLogic {
  late final BehaviorSubject<List<Bubble>> _bubblesController =
      BehaviorSubject<List<Bubble>>.seeded([]);

  Stream<List<Bubble>> get bubblesStream => _bubblesController.stream;

  StreamSubscription<List<Bubble>> listen(
      void Function(List<Bubble> value)? onData) {
    return _bubblesController.listen(onData);
  }

  void generateBubbles() {
    final r = Random();
    _addToStream(r);
    Timer.periodic(3.seconds, (timer) => _addToStream(r));
  }

  void _addToStream(Random r) {
    final List<Bubble> current = _bubblesController.value;

    current.addAll(List.generate(
      _nBubbles(r),
      (_) => Bubble(
        radius: (r.nextDouble() * 25) + 25,
        time: r.nextInt(15) + 20,
        xPos: (r.nextDouble() * 2.2) - 1.1,
        hz: r.nextDouble() * 0.7 + 0.1,
      ),
    ));

    _bubblesController.sink.add(current);
  }

  int _nBubbles(Random random) => random.nextInt(30) + 1;

  dispose() {
    _bubblesController.close();
  }
}
