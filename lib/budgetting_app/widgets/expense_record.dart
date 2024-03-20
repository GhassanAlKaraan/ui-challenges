import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:ui_challenges/budgetting_app/providers/expense_provider.dart';
import 'package:ui_challenges/budgetting_app/resources/app_router.dart';
import 'package:ui_challenges/budgetting_app/resources/assets_manager.dart';
import 'package:ui_challenges/budgetting_app/resources/color_manager.dart';

import '../app/utils.dart' as utils;

class ExpenseRecord extends StatelessWidget {
  const ExpenseRecord({super.key, required this.item});

  final Map<String, dynamic> item;

  @override
  Widget build(BuildContext context) {
    return Stack(clipBehavior: Clip.none, children: [
      ListTile(
        shape: RoundedRectangleBorder(
          side: BorderSide(
            color: ColorManager.primary,
            width: 1.0,
          ),
          borderRadius: BorderRadius.circular(4),
        ),
        leading: Text(
          item['type'] ?? '',
          style: Theme.of(context).textTheme.titleMedium,
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Flexible(
              child: Text(
                '${item['reason'] ?? ''} - ${item['description'] ?? ''}',
                style: Theme.of(context).textTheme.titleSmall,
              ),
            ),
          ],
        ),
        subtitle: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              '${item['amount'].toString()} ${item['currency'] ?? ''}',
              style: Theme.of(context)
                  .textTheme
                  .titleSmall!
                  .copyWith(color: ColorManager.secondary),
            ),
          ],
        ),
        trailing: IconButton(
          icon: const Icon(Icons.delete_outline),
          onPressed: () {
            utils.showAlertDialog(context, () {
              try {
                Provider.of<ExpenseProvider>(context, listen: false)
                    .removeExpense(item['id']!);
                utils.showSnackBar(context, 'Record removed');
              } catch (e) {
                utils.showSnackBar(context, 'Something wrong happened');
              }
            }, 'Delete record from DB');
          },
        ),
        onTap: () {
          context.pushNamed(
            RouteNames.editRecord,
            extra: item,
          );
        },
      ),
      Positioned(
        top: -15,
        left: 2,
        child: CircleAvatar(
          backgroundColor: ColorManager.background,
          child: Image(
            image: AssetImage(item['type'] == 'transport'
                ? IconAssets.transport
                : item['type'] == 'food'
                    ? IconAssets.food
                    : item['type'] == 'health'
                        ? IconAssets.health
                        : item['type'] == 'family'
                            ? IconAssets.family
                            : IconAssets.other),
            width: 35,
            height: 35,
            color:ColorManager.darkSecondary
          ),
        ),
      ),
    ]);
  }
}
