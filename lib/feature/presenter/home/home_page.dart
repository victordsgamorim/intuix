import 'package:quizz/feature/presenter/home/widgets/sliver_app_delegate.dart';

import '../common_libs.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverPersistentHeader(
            pinned: true, delegate: SliverAppDelegate(context)),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, index) {
              return const Card(child: ListTile());
            },
            childCount: 100,
          ),
        )
      ],
    );
  }
}


