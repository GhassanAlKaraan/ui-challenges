import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ui_challenges/budgetting_app/resources/strings_manager.dart';
import '../resources/color_manager.dart';

class MyDrawer extends StatefulWidget {
  const MyDrawer({super.key});

  @override
  State<MyDrawer> createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: ColorManager.primary,
            ),
            child: Text(
              AppStrings.appName,
              style: TextStyle(
                color: ColorManager.background,
                fontSize: 24,
              ),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text('Demo'),
            onTap: () {
              context.pop();
            },
          ),
        ],
      ),
    );
  }
}
