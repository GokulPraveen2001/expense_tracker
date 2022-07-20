import 'package:flutter/cupertino.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import '../data/expense.dart';
import 'items.dart';

class Displayexpenses extends StatelessWidget {
  final List<Expense> expenses;

  Displayexpenses({required this.expenses});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: expenses.length,
        itemBuilder: (context, index) {
          return Items(expense: expenses[index]);
        });
  }
}
