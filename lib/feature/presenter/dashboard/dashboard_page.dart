import 'package:quizz/core/utils/constants/app_style.dart';
import 'package:quizz/feature/presenter/home/home_page.dart';

import '../common_libs.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: AppStyle.bgLinearGradient(context),
        ),
        child: const HomePage(),
      ),
    );
  }
}
