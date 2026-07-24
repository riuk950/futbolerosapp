import 'package:flutter/material.dart';
import 'package:futbolerosapp/config/routes/app_router.dart';
import 'package:futbolerosapp/config/theme/app_theme.dart';
import 'package:futbolerosapp/env/env_def.dart';

class FlavorApp extends StatelessWidget {
  const FlavorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: EnvDef.isProduction,
      theme: AppTheme.lightTheme,
      routerConfig: appRouter,
      builder: (context, child) {
        return MediaQuery(
          data: MediaQuery.of(
            context,
          ).copyWith(textScaler: TextScaler.noScaling),
          child: child!,
        );
      },
    );
  }
}
