import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ui_challenges/budgetting_app/providers/expense_provider.dart';
import 'package:ui_challenges/budgetting_app/resources/app_router.dart';
import 'package:ui_challenges/budgetting_app/resources/theme_manager.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => ExpenseProvider()),
    ],
    child: const MainApp(),
  ));
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  // @override
  // Widget build(BuildContext context) {
  //   return const MaterialApp(
  //       debugShowCheckedModeBanner: false, home: Screen1());
  // }

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: goRouter,
      theme: getApplicationTheme(),
      debugShowCheckedModeBanner: false,
    );
  }

}
