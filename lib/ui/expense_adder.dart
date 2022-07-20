import 'package:flutter/material.dart';

class ExpenseAdder extends StatefulWidget {
  final Function updateexpense;

  ExpenseAdder({required this.updateexpense});

  @override
  State<ExpenseAdder> createState() => _ExpenseAdderState();
}

class _ExpenseAdderState extends State<ExpenseAdder> {
  final _key = GlobalKey<FormState>();

  TextEditingController _item = TextEditingController();

  TextEditingController _price = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: Container(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Form(
              key: _key,
              child: Column(
                children: [
                  Container(
                    child: TextFormField(
                      controller: _item,
                      validator: (item) =>
                          item!.isEmpty ? "Enter an item" : null,
                      keyboardType: TextInputType.text,
                      autofocus: true,
                    ),
                  ),
                  Container(
                    child: TextFormField(
                      controller: _price,
                      validator: (price) =>
                          price!.isEmpty ? "Enter a price" : null,
                      keyboardType: TextInputType.number,
                      autofocus: true,
                    ),
                  ),
                ],
              ),
            ),
            TextButton.icon(
                onPressed: () {
                  if (_key.currentState!.validate()) {
                    print(_item.text);
                    print(double.parse(_price.text).toStringAsFixed(2));

                    widget.updateexpense(
                        _item.text, double.parse(_price.text), DateTime.now());

                    Navigator.of(context).pop();
                  }
                },
                icon: Icon(Icons.add),
                label: Text("Add Expense"))
          ],
        ),
      ),
    );
  }
}
