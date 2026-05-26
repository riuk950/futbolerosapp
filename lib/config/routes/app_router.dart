import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../ui/pages/home_page.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();

final appRouter = GoRouter(
  navigatorKey: _rootNavigatorKey,
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const HomePage(),
    ),
    // Future routes will be added here: /matches, /news, /profile
  ],
);
