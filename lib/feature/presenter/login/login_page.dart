import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:quizz/core/route/route_path.dart';
import 'package:quizz/core/theme/app_theme.dart';
import 'package:quizz/feature/components/content_box_elevated_button.dart';
import 'package:quizz/feature/components/password_textfield.dart';
import 'package:quizz/feature/presenter/common_libs.dart';
import 'package:quizz/gen/assets.gen.dart';

part 'package:quizz/feature/presenter/login/widgets/login_form.dart';

part 'package:quizz/feature/presenter/login/widgets/login_sign_up_button.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final percent = PlatformInfo.isMobileSize(context) ? .6 : .7;
    return SubmarineScaffold(
      contentY: PlatformInfo.isMobileSize(context) ? 0.85 : 0,
      content: (controller) {
        GoRouter.of(context).addListener(() {
          if (GoRouter.of(context).location == '/') {
            controller.forward();
          }
        });

        return ContentBox.allIn(
          height: size.height * percent,
          title: 'Login',
          builder: (c) => LoginForm(
            size: Size(c.maxWidth, c.maxHeight),
            onSignIn: () {},
            onForgotPassword: () =>
                _goTo(controller: controller, path: R.forgotPassword),
          ),
          bottom: LoginSignUpButton(
            onRegisterTap: () =>
                _goTo(controller: controller, path: R.register),
          ),
        );
      },
    );
  }

  void _goTo({
    required AnimationController controller,
    required String path,
  }) =>
      controller.reverse().then((_) => context.go(path));
}
