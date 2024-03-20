import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ui_challenges/budgetting_app/resources/app_router.dart';
import 'package:ui_challenges/budgetting_app/resources/strings_manager.dart';
import 'package:ui_challenges/budgetting_app/widgets/my_fab.dart';
import 'package:ui_challenges/budgetting_app/pages/records/records_listview.dart';
import 'package:ui_challenges/budgetting_app/widgets/my_scaffold.dart';


class RecordsPage extends StatelessWidget {
  const RecordsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MyScaffold(
      appBarTitle: AppStrings.recordsPageTitle,
      hasDrawer: true,
      fab: MyFAB(onPressed: () {
        context.pushNamed(RouteNames.addRecord);
      }),
      child: const Column(
        children: [
          Expanded(
            child: RecordsListView(),
          ),
        ],
      ),
    );
  }
}
