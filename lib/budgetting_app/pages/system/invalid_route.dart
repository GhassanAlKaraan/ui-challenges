import 'package:flutter/material.dart';
import 'package:ui_challenges/budgetting_app/resources/strings_manager.dart';
import 'package:ui_challenges/budgetting_app/resources/values_manager.dart';
import 'package:ui_challenges/budgetting_app/widgets/my_scaffold.dart';

class InvalidRoute extends StatelessWidget {
  const InvalidRoute({super.key});

  @override
  Widget build(BuildContext context) {
    return MyScaffold(
        appBarTitle: AppStrings.invalidRoute,
        hasDrawer: false,
        child: Center(
          child: Column(
            children: [
              const SizedBox(height: AppSize.s180),
              Image.asset('assets/images/invalid_route.png', height: 200),
              const SizedBox(height: AppSize.s28),
              Text(AppStrings.invalidRouteMessage, style: Theme.of(context).textTheme.titleMedium,)
            ],
          ),
        ));
  }
}
