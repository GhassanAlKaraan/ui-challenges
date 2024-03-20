import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ui_challenges/budgetting_app/pages/records/add_expense_card.dart';
import 'package:ui_challenges/budgetting_app/providers/expense_provider.dart';
import 'package:ui_challenges/budgetting_app/resources/strings_manager.dart';
import 'package:ui_challenges/budgetting_app/widgets/my_scaffold.dart';
import '../../app/utils.dart' as utils;

class AddExpense extends StatelessWidget {
  const AddExpense({super.key}); 

  @override
  Widget build(BuildContext context) {
    return MyScaffold(
      appBarTitle: AppStrings.addRecordTitle,
      hasDrawer: false,
      child: AddExpenseCard(onSave: (Map<String, dynamic> newDetails) {
        try {
          Provider.of<ExpenseProvider>(context, listen: false).addExpense(newDetails);
        } catch (e) {
          utils.showSnackBar(context, 'Something went wrong!');
        }
      }),
    );
  }
}
