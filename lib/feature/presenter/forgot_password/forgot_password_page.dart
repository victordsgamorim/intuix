import 'package:quizz/feature/presenter/common_libs.dart';

part 'package:quizz/feature/presenter/forgot_password/widgets/forgot_password_form.dart';

class ForgotPasswordPage extends StatelessWidget {
  const ForgotPasswordPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SubmarineScaffold(
      hasAppBar: true,
      contentY: 0,
      content: (controller) => ContentBox(
        height: size.height * .3,
        title: 'Forgot Password',
        titleFontSize: 44,
        builder: (c) => const ForgotPasswordForm(),
      ),
    );
  }
}
