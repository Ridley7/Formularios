import 'package:formulario_flutter/presentation/screens/bloc_counter_screen.dart';
import 'package:formulario_flutter/presentation/screens/cubit_counter_screen.dart';
import 'package:formulario_flutter/presentation/screens/home_screen.dart';
import 'package:formulario_flutter/presentation/screens/register_screen.dart';
import 'package:go_router/go_router.dart';

final appRouter = GoRouter(
  routes: [

    GoRoute(
        path: '/',
      builder: (context, state) => const HomeScreen()
    ),

    GoRoute(
      path: '/cubits',
      builder: (context, state) => CubitCounterScreen()
    ),

    GoRoute(
      path: '/counter-bloc',
      builder: (context, state) => BlocCounterScreen()
    ),

      GoRoute(
          path: '/new-user',
          builder: (context, state) => RegisterScreen()
      )

  ]
);