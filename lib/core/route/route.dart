import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:quizz/core/route/route_path.dart';
import 'package:quizz/feature/presenter/forgot_password/forgot_password_page.dart';
import 'package:quizz/feature/presenter/login/login_page.dart';
import 'package:quizz/feature/presenter/register/register_page.dart';

GoRouter router = GoRouter(
  routes: [
    GoRoute(
        path: RoutePath.init,
        builder: (context, state) => const LoginPage(),
        routes: [
          FadeTransitionGoRouter(
              path: RoutePath.register, child: const RegisterPage()),
          FadeTransitionGoRouter(
              path: RoutePath.forgotPassword,
              child: const ForgotPasswordPage()),
        ])
  ],
);

class FadeTransitionGoRouter extends GoRoute {
  FadeTransitionGoRouter({
    required String path,
    required Widget child,
    Duration duration = const Duration(milliseconds: 750),
    List<GoRoute> routes = const [],
  }) : super(
            path: path,
            routes: routes,
            pageBuilder: (context, state) => CustomTransitionPage(
                  key: state.pageKey,
                  child: child,
                  transitionDuration: duration,
                  transitionsBuilder: (_, a, __, c) =>
                      FadeTransition(opacity: a, child: c),
                ));
}
