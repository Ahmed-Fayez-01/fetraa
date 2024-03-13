import 'package:fetraa/features/auth/presentation/views/login_view.dart';
import 'package:go_router/go_router.dart';
import 'package:fetraa/features/auth/presentation/views/register_view.dart';
import '../../../features/auth/presentation/views/intro_auth.dart';
import '../../../features/main_layout/presentation/views/main_layout_view.dart';
import '../../../features/splash/presentation/views/splash_view.dart';

abstract class AppRouter {
  static final router = GoRouter(routes: [
    //Splash Roots
    GoRoute(
      path: "/",
      builder: (context, state) => const SplashView(),
    ),
    //Onboarding Roots
    GoRoute(
      path: "/introAuthView",
      builder: (context, state) => const IntroAuthView(),
    ),
    GoRoute(
      path: "/loginView",
      builder: (context, state) => const LoginView(),
    ),
    GoRoute(
      path: "/registerView",
      builder: (context, state) => const RegisterView(),
    ),
    GoRoute(
      path: "/mainLayoutView",
      builder: (context, state) => MainLayoutView(),
    ),

  ]);
}
