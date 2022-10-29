import 'package:flutter/material.dart';

class NewTransaction extends StatefulWidget {
  final Function addTx;

  NewTransaction(this.addTx);

  @override
  State<NewTransaction> createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final titleController = TextEditingController();
  final amountController = TextEditingController();

  void _submitData() {
    final enteredTitle = titleController.text;
    final enteredAmount = double.parse(amountController.text);

    if (enteredTitle.isEmpty || enteredAmount <= 0) {
      return;
    }
    // This widget objet allows us to access stuff in widget class from the
    // state class
    widget.addTx(enteredTitle, enteredAmount);

    // This pops off top most screen
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
          TextField(
            controller: titleController,
            decoration: InputDecoration(labelText: 'Title: '),
            // onChanged: (str) => titleInput = str,
            onSubmitted: (_) => _submitData(),
          ),
          TextField(
            controller: amountController,
            decoration: InputDecoration(labelText: 'Amount: '),
            keyboardType: TextInputType.number,
            // onChanged: (str) => amountInput = str,
            onSubmitted: (_) => _submitData(),
          ),
          Container(
            height: 70,
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: Text('No Date Chosen!'),
                ),
                TextButton(
                    onPressed: () {},
                    child: Text(
                      "Choose Date",
                    ))
              ],
            ),
          ),
          ElevatedButton(
            child: Text('Add Transaction'),
            onPressed: _submitData,
          )
        ]),
      ),
    );
  }
}
