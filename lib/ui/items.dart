import 'package:flutter/material.dart';
import '/data/expense.dart';
import 'package:intl/intl.dart';

class Items extends StatelessWidget {
  final Expense expense;

  Items({required this.expense});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 0.0, horizontal: 5.0),
      padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 0.0),
      child: Card(
          elevation: 5.0,
          shadowColor: Colors.blue,
          child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
            Container(
              margin: EdgeInsets.all(8.0),
              padding: EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.red.shade400, width: 2.0)),
              child: Text("\$ ${expense.price.toStringAsFixed(2)}",
                  style:
                      TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold)),
            ),
            Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(expense.item,
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 20.0)),
                  Text(
                    DateFormat.yMMMEd().format(expense.date),
                    style: TextStyle(color: Colors.grey),
                  ),
                ])
          ])),
    );
  }
}
