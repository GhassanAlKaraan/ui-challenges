import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ui_challenges/budgetting_app/providers/expense_provider.dart';
import 'package:ui_challenges/budgetting_app/resources/strings_manager.dart';
import 'package:ui_challenges/budgetting_app/widgets/my_scaffold.dart';

import 'edit_expense_card.dart';


class EditExpanse extends StatelessWidget {
  const EditExpanse({super.key, required this.expense});
  final Map<String, dynamic> expense;

  @override
  Widget build(BuildContext context) {
    return MyScaffold(
      appBarTitle: AppStrings.editRecordTitle,
      hasDrawer: false,
      child: EditExpanseCard(map: expense, onSave: (String id, Map<String, dynamic> newExpenseMap) {
        
        Provider.of<ExpenseProvider>(context, listen: false).updateRecord(id, newExpenseMap);
      }),
    );
  }
}
