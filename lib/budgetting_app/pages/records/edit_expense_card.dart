// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:ui_challenges/budgetting_app/app/functions.dart';
import 'package:ui_challenges/budgetting_app/resources/color_manager.dart';
import 'package:ui_challenges/budgetting_app/resources/values_manager.dart';
import 'package:ui_challenges/budgetting_app/widgets/my_dropdown.dart';
import '../../app/utils.dart' as utils;

class EditExpanseCard extends StatefulWidget {
  final Map<String, dynamic> map;
  final Function(String, Map<String, dynamic>) onSave; // callback

  const EditExpanseCard({super.key, required this.map, required this.onSave});

  @override
  State<EditExpanseCard> createState() => _EditExpanseCardState();
}

class _EditExpanseCardState extends State<EditExpanseCard> {
  // Form key
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  // Values
  var _chosenCurrencyValue;
  var _chosenTypeValue;
  final List<String> _currencyList = ["LBP", "USD"];

  // Controllers
  final TextEditingController _reasonController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _amountController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _reasonController.text = widget.map['reason']!;
    _descriptionController.text = widget.map['description'] ?? "";
    _amountController.text = widget.map['amount'].toString();
    _chosenCurrencyValue = widget.map['currency']!;
    _chosenTypeValue = widget.map['type']!;
  }

  @override
  void dispose() {
    super.dispose();
    _reasonController.dispose();
    _descriptionController.dispose();
    _amountController.dispose();
  }

  void _updateRecord() async {
    if (_formKey.currentState!.validate()) {
      // loading not implemented

      String id = widget.map['id']!;

      Map<String, dynamic> newRecord = {
        'type': _chosenTypeValue,
        'reason': _reasonController.text.trim(),
        'description': _descriptionController.text.trim(),
        'amount': int.tryParse(_amountController.text.trim()) ?? 0,
        'currency': _chosenCurrencyValue
      };

      widget.onSave(id, newRecord);
      utils.showSnackBar(context, 'Record updated.');
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
                // Displaying non-editable fields as Text
                Text(
                  'Type: ${widget.map['type']}',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                const SizedBox(height: AppSize.s20),
                // Editable fields start here
                TextFormField(
                  maxLength: 20,
                  maxLengthEnforcement: MaxLengthEnforcement.enforced,
                  controller: _reasonController,
                  validator: _validateReason,
                  decoration: const InputDecoration(labelText: 'Reason',counterText: "",),
                ),
                const SizedBox(height: AppSize.s10),
                TextFormField(
                  maxLength: 50,
                  maxLengthEnforcement: MaxLengthEnforcement.enforced,
                  maxLines: 3,
                  minLines: 3,
                  controller: _descriptionController,
                  decoration: const InputDecoration(labelText: 'Description',counterText: "",),
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
                  decoration: const InputDecoration(labelText: 'Amount',counterText: "",),
                  keyboardType: TextInputType.number,
                ),
                const SizedBox(height: AppSize.s10),
                MyDropDown(
                  hintText: "Currency",
                  listOfValues: _currencyList,
                  initialValue: _chosenCurrencyValue,
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
                      onPressed: _updateRecord,
                      child: const Text('Save Changes'),
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
