// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:ui_challenges/budgetting_app/app/functions.dart';
import 'package:ui_challenges/budgetting_app/resources/color_manager.dart';
import 'package:ui_challenges/budgetting_app/resources/values_manager.dart';
import 'package:ui_challenges/budgetting_app/widgets/my_dropdown.dart';
import '../../app/utils.dart' as utils;

class AddExpenseCard extends StatefulWidget {
  final Function(Map<String, dynamic>) onSave; // callback

  const AddExpenseCard({super.key, required this.onSave});

  @override
  State<AddExpenseCard> createState() => _AddExpenseCardState();
}

class _AddExpenseCardState extends State<AddExpenseCard> {
  // Form key
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  // Values
  var _chosenTypeValue;
  var _chosenCurrencyValue;

  final List<String> _typeList = ["family", "food", "health", "transport", "other"];
  final List<String> _currencyList = ["LBP", "USD"];

  // Controllers
  final TextEditingController _reasonController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _amountController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _reasonController.dispose();
    _descriptionController.dispose();
    _amountController.dispose();
  }

  void _createRecord() async {
    if (_formKey.currentState!.validate()) {
      // loading not implemented
      Map<String, dynamic> newDetails = {
        'type': _chosenTypeValue,
        'reason': _reasonController.text.trim(),
        'description': _descriptionController.text.trim(),
        'amount': int.tryParse(_amountController.text.trim()) ?? 0,
        'currency': _chosenCurrencyValue!
      };
      widget.onSave(newDetails);
      utils.showSnackBar(context, 'Record created.');
      context.pop();
    }
  }

  String? _validateReason(String? reason) {
    if (reason == null || reason.isEmpty) {
      return "Please specify reason";
    }
    return null;
  }

  String? _validateAmount(String? amount) {
    if (amount == null || amount.isEmpty) {
      return "Please specify amount";
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Card(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppSize.s14)),
        elevation: 1,
        color: ColorManager.background,
        margin: const EdgeInsets.all(AppMargin.m8),
        child: Padding(
          padding: const EdgeInsets.all(AppPadding.p20),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(height: AppSize.s20),
                MyDropDown(
                  hintText: "Type",
                  listOfValues: _typeList,
                  onChoose: (value) {
                    setState(() {
                      _chosenTypeValue = value;
                    });
                  },
                ),
                const SizedBox(height: AppSize.s10),
                TextFormField(
                  maxLength: 20,
                  maxLengthEnforcement: MaxLengthEnforcement.enforced,
                  controller: _reasonController,
                  validator: _validateReason,
                  decoration: const InputDecoration(
                    labelText: 'Reason',
                    counterText: "",
                  ),
                ),
                const SizedBox(height: AppSize.s10),
                TextFormField(
                  maxLength: 50,
                  maxLengthEnforcement: MaxLengthEnforcement.enforced,
                  maxLines: 3,
                  minLines: 3,
                  controller: _descriptionController,
                  decoration: const InputDecoration(
                    labelText: 'Description',
                    counterText: "",
                  ),
                ),
                const SizedBox(height: AppSize.s10),
                TextFormField(
                  maxLength: 9,
                  maxLengthEnforcement: MaxLengthEnforcement.enforced,
                  inputFormatters: <TextInputFormatter>[
                    createNumberFilter(),
                    // NumberInputFormatter()
                  ],
                  controller: _amountController,
                  validator: _validateAmount,
                  decoration: const InputDecoration(
                    labelText: 'Amount',
                    counterText: "",
                  ),
                  keyboardType: TextInputType.number,
                ),
                const SizedBox(height: AppSize.s10),
                MyDropDown(
                  hintText: "Currency",
                  listOfValues: _currencyList,
                  onChoose: (value) {
                    setState(() {
                      _chosenCurrencyValue = value;
                    });
                  },
                ),
                const SizedBox(height: AppSize.s40),
                Column(
                  children: [
                    ElevatedButton(
                      onPressed: _createRecord,
                      child: const Text('Create Record'),
                    ),
                  ],
                ),
                const SizedBox(height: AppSize.s25),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
