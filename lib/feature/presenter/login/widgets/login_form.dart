part of 'package:quizz/feature/presenter/login/login_page.dart';

class LoginForm extends StatefulWidget {
  final Size size;
  final VoidCallback onForgotPassword;
  final VoidCallback onSignIn;

  const LoginForm({
    super.key,
    required this.size,
    required this.onForgotPassword,
    required this.onSignIn,
  });

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm>
    with SingleTickerProviderStateMixin {
  late final TextEditingController _emailController = TextEditingController();
  late final TextEditingController _passwordController =
      TextEditingController();
  late final FocusNode _emailNode = FocusNode();
  late final FocusNode _passwordNode = FocusNode();
  late final AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: 300.milliseconds);
  }

  @override
  Widget build(BuildContext context) {
    return FormBase(
      texts: [
        Column(
          children: [
            Text(
              'Intuix',
              style: TextStyle(
                fontSize: widget.size.height < 400 ? 38 : 40,
                color: Theme.of(context).colorScheme.onSecondaryContainer,
              ),
            ),
            Text(
              'Challenge your knowledge, conquer the glory. Welcome to the world of quizzes!',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: widget.size.height < 400 ? 14 : 16,
                color: Theme.of(context).colorScheme.onSecondaryContainer,
              ),
            ),
          ],
        )
      ],
      forms: [
        Column(
          children: [
            TextField(
              controller: _emailController,
              focusNode: _emailNode,
              keyboardType: TextInputType.emailAddress,
              cursorColor: TextFormFieldStyle.cursorColor(context),
              onChanged: _shouldPlayAnimation,
              decoration: const InputDecoration(hintText: 'E-mail'),
              style: TextStyle(
                color: TextFormFieldStyle.fontColor(context),
              ),
            ),
            AnimatedBuilder(
              animation: _animationController,
              child: TextFieldPassword(
                hintText: 'Password',
                controller: _passwordController,
                node: _passwordNode,
              ),
              builder: (_, child) {
                return Opacity(
                  opacity: _animationController.value,
                  child: Padding(
                    padding: EdgeInsets.only(
                        top: (widget.size.height < 400 ? 8 : 16) *
                            _animationController.value),
                    child: IgnorePointer(
                        ignoring: _animationController.value == 0,
                        child: child!),
                  ),
                );
              },
            ),
          ],
        ),
      ],
      buttons: (state) {
        return [
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: ContentBoxElevatedButton(
                  title: 'Sign In',
                  onTap: widget.onSignIn,
                ),
              ),
              TextButton(
                onPressed: widget.onForgotPassword,
                child: const Text(
                  'Forgot password',
                  style: TextStyle(fontSize: 14),
                ),
              )
            ],
          ),
        ];
      },
    );
  }

  void _shouldPlayAnimation(String value) {
    value.isNotEmpty
        ? _animationController.forward()
        : _animationController.reverse();
  }

  @override
  void dispose() {
    _animationController.dispose();
    _emailController.dispose();
    _emailNode.dispose();
    _passwordController.dispose();
    _passwordNode.dispose();
    super.dispose();
  }
}
