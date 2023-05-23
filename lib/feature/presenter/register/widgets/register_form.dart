part of 'package:quizz/feature/presenter/register/register_page.dart';

class RegisterForm extends StatefulWidget {
  const RegisterForm({Key? key}) : super(key: key);

  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  late final TextEditingController _nameController = TextEditingController();
  late final TextEditingController _emailController = TextEditingController();
  late final TextEditingController _passwordController =
      TextEditingController();
  late final TextEditingController _confirmPasswordController =
      TextEditingController();
  late final FocusNode _nameNode = FocusNode();
  late final FocusNode _emailNode = FocusNode();
  late final FocusNode _passwordNode = FocusNode();
  late final FocusNode _confirmPasswordNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: FormBase(
          forms: [
            TextField(
              controller: _nameController,
              focusNode: _nameNode,
              keyboardType: TextInputType.text,
              cursorColor: TextFormFieldStyle.cursorColor(context),
              decoration: const InputDecoration(hintText: 'Name'),
              style: TextStyle(color: TextFormFieldStyle.fontColor(context)),
            ),
            TextField(
              controller: _emailController,
              focusNode: _emailNode,
              keyboardType: TextInputType.emailAddress,
              cursorColor: TextFormFieldStyle.cursorColor(context),
              decoration: const InputDecoration(hintText: 'E-mail'),
              style: TextStyle(color: TextFormFieldStyle.fontColor(context)),
            ),
            TextFieldPassword(
              hintText: 'Password',
              controller: _passwordController,
              node: _passwordNode,
            ),
            TextFieldPassword(
              hintText: 'Confirm Password',
              controller: _confirmPasswordController,
              node: _confirmPasswordNode,
            ),
          ],
          buttons: (state) {
            return [
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {},
                  child: const Text('Sign In'),
                ),
              )
            ];
          }),
    );
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    _nameNode.dispose();
    _emailNode.dispose();
    _passwordNode.dispose();
    _confirmPasswordNode.dispose();
    super.dispose();
  }
}
