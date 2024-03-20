import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ui_challenges/budgetting_app/pages/records/add_expense.dart';
import 'package:ui_challenges/budgetting_app/pages/records/edit_expense.dart';
import 'package:ui_challenges/budgetting_app/pages/records/records_page.dart';
import 'package:ui_challenges/budgetting_app/pages/splash/splash_page.dart';
import 'package:ui_challenges/budgetting_app/pages/system/invalid_route.dart';

GoRouter goRouter = GoRouter(
  errorBuilder: (context, state) => const InvalidRoute(),
  initialLocation: RoutePaths.splash,
  routes: [
    GoRoute(
      path: RoutePaths.splash,
      name: RouteNames.splash,
      builder: (context, state) => const SplashPage(),
    ),
    GoRoute(
      path: RoutePaths.records,
      name: RouteNames.records,
      pageBuilder: (context, state) {
        return CustomTransitionPage(
          transitionDuration: const Duration(seconds: 2),
          fullscreenDialog: true,
          key: state.pageKey,
          child: const RecordsPage(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(
              opacity:
                  CurveTween(curve: Curves.easeInOutCirc).animate(animation),
              child: child,
            );
          },
        );
      },
      routes: [
        GoRoute(
          path: RoutePaths.editRecord,
          name: RouteNames.editRecord,
          pageBuilder: (context, state) {
            Map<String, dynamic> map = state.extra as Map<String, dynamic>;
            return CustomTransitionPage(
              transitionDuration: const Duration(seconds: 1),
              fullscreenDialog: true,
              key: state.pageKey,
              child: EditExpanse(
                expense: map,
              ),
              transitionsBuilder:
                  (context, animation, secondaryAnimation, child) {
                Offset begin = const Offset(-1.0, 0.0); // start position
                Offset end = Offset.zero; // end position
                var curve = Curves.easeInOutCirc;

                var tween = Tween<Offset>(begin: begin, end: end).chain(
                  CurveTween(curve: curve),
                );

                return SlideTransition(
                  position: animation.drive(tween),
                  child: child,
                );
              },
            );
          },
        ),
        GoRoute(
          path: RoutePaths.addRecord,
          name: RouteNames.addRecord,
          pageBuilder: (context, state) {
            return CustomTransitionPage(
              transitionDuration: const Duration(seconds: 1),
              fullscreenDialog: true,
              key: state.pageKey,
              child: const AddExpense(),
              transitionsBuilder:
                  (context, animation, secondaryAnimation, child) {
                Offset begin = const Offset(1.0, 0.0); // start position
                Offset end = Offset.zero; // end position
                var curve = Curves.easeInOutCirc;

                var tween = Tween<Offset>(begin: begin, end: end).chain(
                  CurveTween(curve: curve),
                );

                return SlideTransition(
                  position: animation.drive(tween),
                  child: child,
                );
              },
            );
          },
        ),
      ],
    )
  ],
);

class RouteNames {
  static const splash = 'splash';

  static const login = 'login';

  static const records = 'records';
  static const editRecord = 'editRecord';
  static const addRecord = 'addRecord';
}

class RoutePaths {
  static const splash = '/';

  static const login = '/login';

  static const records = '/records';
  // children routes
  static const editRecord = 'editRecord';
  static const addRecord = 'addRecord';
}
