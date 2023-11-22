
import 'package:go_router/go_router.dart';
import 'package:mogu_web/main_page/view/main_page_screen.dart';
import '../../start_page/view/start_page_screen.dart';


final router = GoRouter(

    routes: [
      GoRoute(
        path: '/',
        builder: (context, state){
          return StartPage();
        },
        routes: [
          GoRoute(
            path: 'main',
            builder: (context,state){
              return MainPage();
            }
          ),
        ],
      ),
    ],


);

