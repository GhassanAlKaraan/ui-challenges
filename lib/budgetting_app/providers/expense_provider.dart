import 'package:flutter/material.dart';
import 'dart:math';

String generateRandomId() {
  const int length = 32;
  const String chars = '0123456789abcdef';
  final Random rnd = Random.secure();
  String randomId = List.generate(length, (index) => chars[rnd.nextInt(chars.length)]).join();

  return randomId;
}

class ExpenseProvider extends ChangeNotifier {
  // ignore: prefer_final_fields
  List<Map<String, dynamic>> _expensesList = [
    {
      "id": "61fbaaf7b7744190848e0655fc868e68",
      "type": "transport",
      "reason": "Annual maintenance",
      "description": "Routine car service",
      "amount": 269,
      "currency": "LBP"
    },
    {
      "id": "915fcf494081455e9ea0d22904fb2c14",
      "type": "other",
      "reason": "Fuel refill",
      "description": "Highway toll payment",
      "amount": 436,
      "currency": "LBP"
    },
    {
      "id": "43ddb01703fc41eeb0be1643b6f880b2",
      "type": "food",
      "reason": "Oil change",
      "description": "Brakes checkup and repair",
      "amount": 278,
      "currency": "USD"
    },
    {
      "id": "1f27a42cf8c448598a6d53f49f80048b",
      "type": "family",
      "reason": "Annual maintenance",
      "description": "Yearly insurance update",
      "amount": 321,
      "currency": "USD"
    },
    {
      "id": "0d26cf032d044e38a9436e9749eb8cb4",
      "type": "transport",
      "reason": "Oil change",
      "description": "Yearly insurance update",
      "amount": 221,
      "currency": "USD"
    },
    {
      "id": "4e2845369bc846fdb4607293b1201cf7",
      "type": "transport",
      "reason": "Battery replacement",
      "description": "Gasoline top-up",
      "amount": 227,
      "currency": "USD"
    },
    {
      "id": "66561619478e4b30a84c9d1d2bfc8d4a",
      "type": "family",
      "reason": "Engine repair",
      "description": "Worn tire change",
      "amount": 40,
      "currency": "USD"
    },
    {
      "id": "a9107487e490400b89e8642b9f300132",
      "type": "other",
      "reason": "Battery replacement",
      "description": "New battery installation",
      "amount": 331,
      "currency": "USD"
    },
    {
      "id": "9df41bb658124a6f9ddf6b389fbaf486",
      "type": "transport",
      "reason": "Insurance renewal",
      "description": "Worn tire change",
      "amount": 166,
      "currency": "LBP"
    },
    {
      "id": "dd564e13378d4f76aa898c50897a7775",
      "type": "health",
      "reason": "Parking fees",
      "description": "Gasoline top-up",
      "amount": 99,
      "currency": "LBP"
    }
  ];

  List<Map<String, dynamic>> get expensesList => _expensesList;

  // Add record to List
  Future<void> addExpense(Map<String, dynamic> expenseDetails) async {
    try {
      // RecordModel newRecord = await _httpService.createRecord(recordDetails);

      Map <String, dynamic> newExpense = {
        "id": generateRandomId(),
        "type": expenseDetails["type"],
        "reason": expenseDetails["reason"],
        "description": expenseDetails["description"],
        "amount": expenseDetails["amount"],
        "currency": expenseDetails["currency"]
      };
      _expensesList.add(newExpense);
      notifyListeners();
    } catch (e) {
      throw Exception('Error adding the record: $e');
    }
  }

  // Remove record from List
  Future<void> removeExpense(String id) async {
    try {
      // await _httpService.deleteRecord(id);
      _expensesList.removeWhere((expense) => expense['id'] == id);
      notifyListeners();
    } catch (e) {
      throw Exception('Error removing the record: $e');
    }
  }

  // Update record in List
  Future<void> updateRecord(String id, Map<String, dynamic> newExpenseDetails) async {
    try {
      int index = _expensesList.indexWhere((expense) => expense['id'] == id);
      if (index != -1) {
        // _expensesList[index] = newExpenseDetails; //! incorrect update
        _expensesList[index].addAll(newExpenseDetails);
        //
        notifyListeners();
      } else {
        throw Exception('Record with ID $id not found');
      }
    } catch (e) {
      throw Exception('Error updating the record: $e');
    }
  }
}
