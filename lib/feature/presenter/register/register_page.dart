import 'package:quizz/feature/components/password_textfield.dart';
import 'package:quizz/feature/presenter/common_libs.dart';

part 'package:quizz/feature/presenter/register/widgets/register_form.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SubmarineScaffold(
      hasAppBar: true,
      content: (controller) => ContentBox(
        height: MediaQuery.of(context).size.height * .6,
        title: 'Register',
        builder: (c) => const RegisterForm(),
      ),
    );
  }
}
