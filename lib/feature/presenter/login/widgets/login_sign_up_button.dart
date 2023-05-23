part of 'package:quizz/feature/presenter/login/login_page.dart';

class LoginSignUpButton extends StatelessWidget {
  final VoidCallback onRegisterTap;

  const LoginSignUpButton({super.key, required this.onRegisterTap});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 600),
          child: FractionallySizedBox(
              widthFactor: .6,
              child: Divider(color: Colors.white.withOpacity(.5))),
        ),
        TextButton(
          onPressed: onRegisterTap,
          style: defaultTextButtonThemeData,
          child: const Text('Sign Up'),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _SocialMediaIcon(
                lightPath: Assets.icons.socialMedia.googleLight,
                darkPath: Assets.icons.socialMedia.googleDark,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 24.0),
                child: _SocialMediaIcon(
                  lightPath: Assets.icons.socialMedia.facebookLight,
                  darkPath: Assets.icons.socialMedia.facebookDark,
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}

class _SocialMediaIcon extends StatelessWidget {
  final String lightPath;
  final String darkPath;

  const _SocialMediaIcon({
    required this.lightPath,
    required this.darkPath,
  });

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: Colors.white,
      radius: 16,
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: SvgPicture.asset(
          MediaQuery.of(context).platformBrightness == Brightness.dark
              ? darkPath
              : lightPath,
        ),
      ),
    );
  }
}
