
import 'package:go_router/go_router.dart';
import 'package:mogu_web/main_page/view/main_page_view.dart';
import '../../signup_page/view/signup_page_view.dart';
import '../../start_page/view/start_page_view.dart';


final router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => StartPage(),
      routes: [
        GoRoute(
          path: 'main',
          builder: (context, state) => MainPage(),
        ),
      ],
    ),
  ],
);

