import 'package:expense_tracker/ui/items.dart';
import 'package:flutter/material.dart';
import '/data/expense.dart';
import 'display_expense.dart';
import 'expense_adder.dart';

class HOME extends StatefulWidget {
  @override
  State<HOME> createState() => _HOMEState();
}

class _HOMEState extends State<HOME> {
  List<Expense> expenses = [
    Expense(price: 12.0, item: "Shirt", date: DateTime.now()),
    Expense(price: 120.0, item: "Pant", date: DateTime.now()),
  ];

  void opendropdown(BuildContext pctx) {
    showModalBottomSheet(
        isScrollControlled: true,
        context: pctx,
        builder: (ctx) {
          return ExpenseAdder(updateexpense: addexpense);
        });
  }

  void addexpense(String item_name, double item_price, DateTime item_date) {
    Expense expense =
        Expense(price: item_price, item: item_name, date: item_date);

    print(expense.price);
    print(expense.item);
    print(expense.date);

    setState(() {
      expenses.add(expense);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: Text("Expense Tracker",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {
                opendropdown(context);
              },
              icon: Icon(Icons.add, color: Colors.red))
        ],
      ),
      body: Displayexpenses(expenses: expenses),
      floatingActionButtonLocation: FloatingActionButtonLocation
          .centerDocked, //does not cover the content in main page
      floatingActionButton: FloatingActionButton(
          //backgroundColor: Colors.black,
          onPressed: () {
            opendropdown(context);
          },
          child: Icon(Icons.add, color: Colors.red)),
    );
  }
}
