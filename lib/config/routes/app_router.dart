import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../ui/pages/home_page.dart';
import '../../ui/pages/login_page.dart';
import '../../ui/pages/main_shell.dart';
import '../../ui/pages/matches_page.dart';
import '../../ui/pages/noticias_page.dart';
import '../../ui/pages/perfil_page.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();

final appRouter = GoRouter(
  navigatorKey: _rootNavigatorKey,
  initialLocation: '/login',
  routes: [
    GoRoute(
      path: '/login',
      builder: (context, state) => const LoginPage(),
    ),
    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) {
        return MainShellPage(navigationShell: navigationShell);
      },
      branches: [
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/',
              builder: (context, state) => const HomePage(),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/matches',
              builder: (context, state) => const MatchesPage(),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/noticias',
              builder: (context, state) => const NoticiasPage(),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/profile',
              builder: (context, state) => const PerfilPage(),
            ),
          ],
        ),
      ],
    ),
  ],
);
