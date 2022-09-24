import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {
  final Function addTx;

  final titleController = TextEditingController();
  final amountController = TextEditingController();

  NewTransaction(this.addTx);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
          TextField(
            controller: titleController,
            // onChanged: (str) => titleInput = str,
            decoration: InputDecoration(labelText: 'Title: '),
          ),
          TextField(
            controller: amountController,
            // onChanged: (str) => amountInput = str,
            decoration: InputDecoration(labelText: 'Amount: '),
          ),
          TextButton(
            onPressed: () {
              addTx(titleController.text, double.parse(amountController.text));
            },
            child: Text('Add Transaction'),
            style: TextButton.styleFrom(foregroundColor: Colors.purple),
          )
        ]),
      ),
    );
  }
}
