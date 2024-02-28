import 'package:asyncstate/asyncstate.dart';
import 'package:dw_barbershop/src/core/ui/widgets/barbeshop_loader.dart';
import 'package:dw_barbershop/src/features/auth/login/login_page.dart';
import 'package:dw_barbershop/src/features/splash/splash_page.dart';
import 'package:flutter/material.dart';

class BarbershopApp extends StatelessWidget {
  const BarbershopApp({super.key});

  @override
  Widget build(BuildContext context) {
    return AsyncStateBuilder(
        customLoader: const BarbeshopLoader(),
        builder: (asyncNavigatorObserver) {
          return MaterialApp(
            navigatorObservers: [asyncNavigatorObserver],
            title: 'DW Barbershop',
            debugShowCheckedModeBanner: false,
            routes: {
              '/': (_) => const SplashPage(),
              '/auth/login': (_) => const LoginPage(),
            },
          );
        });
  }
}
