part of 'package:quizz/feature/presenter/forgot_password/forgot_password_page.dart';

class ForgotPasswordForm extends StatefulWidget {
  const ForgotPasswordForm({Key? key}) : super(key: key);

  @override
  State<ForgotPasswordForm> createState() => _ForgotPasswordFormState();
}

class _ForgotPasswordFormState extends State<ForgotPasswordForm> {
  late final TextEditingController _emailController = TextEditingController();
  late final FocusNode _emailNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return FormBase(
      texts: [
        Text(
          'Reset the password and unlock the hidden secrets of the quiz!',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Theme.of(context).colorScheme.onSecondaryContainer,
          ),
        ),
      ],
      forms: [
        TextField(
          controller: _emailController,
          focusNode: _emailNode,
          keyboardType: TextInputType.emailAddress,
          cursorColor: TextFormFieldStyle.cursorColor(context),
          decoration: const InputDecoration(hintText: 'E-mail'),
          style: TextStyle(
            color: TextFormFieldStyle.fontColor(context),
          ),
        ),
      ],
      buttons: (state) {
        return [
          Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: () {},
                child: const Text('Sign In'),
              ),
            ),
          )
        ];
      },
    );
  }
}
