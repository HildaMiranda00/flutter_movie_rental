import 'package:go_router/go_router.dart';
import 'package:project_hadmc/second_page.dart';
import 'package:project_hadmc/form_page.dart';
import 'package:project_hadmc/src/features/forms/ui/login.dart';
import 'package:project_hadmc/src/features/forms/ui/available_movies.dart';
import 'package:project_hadmc/src/features/forms/ui/tab_bar.dart';

final router = GoRouter(
  routes: [
    GoRoute(
      path: "/",
      builder: (context, state) => Login(),),
      
      GoRoute(path: "/second",
      builder: (context, state) => SecondPage(),),
     
      GoRoute(path: "/form",
      builder: (context, state) => FormPage(),),

      GoRoute(path: "/home",
      builder: (context, state) => AvailableMovies(),),

      GoRoute(path: "/homePage",
      builder: (context, state) => HomePage(),)
  ,],
);