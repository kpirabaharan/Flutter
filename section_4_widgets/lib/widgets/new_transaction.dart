import 'dart:io';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

class NewTransaction extends StatefulWidget {
  final Function addTx;

  NewTransaction(this.addTx);

  @override
  State<NewTransaction> createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  DateTime? _selectedDate;

  void _submitData() {
    if (_amountController.text.isEmpty) {
      return;
    }
    final enteredTitle = _titleController.text;
    final enteredAmount = double.parse(_amountController.text);

    if (enteredTitle.isEmpty || enteredAmount <= 0 || _selectedDate == null) {
      return;
    }
    // This widget objet allows us to access stuff in widget class from the
    // state class
    widget.addTx(enteredTitle, enteredAmount, _selectedDate);

    // This pops off top most screen
    Navigator.of(context).pop();
  }

  void _presentDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime.now(),
    ).then((pickedDate) {
      if (pickedDate == null) {
        return;
      }
      setState(() {
        _selectedDate = pickedDate;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Card(
        elevation: 5,
        child: Padding(
          padding: EdgeInsets.only(
            top: 10,
            left: 10,
            right: 10,
          ),
          child: Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
            Platform.isIOS
                ? CupertinoTextField(
                    style: TextStyle(fontSize: 24),
                    controller: _titleController,
                    placeholder: "Title",
                    decoration: BoxDecoration(
                      color: CupertinoColors.extraLightBackgroundGray,
                      border: Border.all(
                        width: 2,
                        color: CupertinoColors.lightBackgroundGray,
                      ),
                    ),
                    onSubmitted: (_) => _submitData(),
                  )
                : TextField(
                    controller: _titleController,
                    decoration: InputDecoration(labelText: 'Title: '),
                    onSubmitted: (_) => _submitData(),
                  ),
            Platform.isIOS
                ? CupertinoTextField(
                    style: TextStyle(fontSize: 24),
                    controller: _amountController,
                    placeholder: "Amount",
                    decoration: BoxDecoration(
                      color: CupertinoColors.extraLightBackgroundGray,
                      border: Border.all(
                        width: 2,
                        color: CupertinoColors.lightBackgroundGray,
                      ),
                    ),
                    keyboardType: TextInputType.number,
                    onSubmitted: (_) => _submitData(),
                  )
                : TextField(
                    controller: _amountController,
                    decoration: InputDecoration(labelText: 'Amount: '),
                    keyboardType: TextInputType.number,
                    onSubmitted: (_) => _submitData(),
                  ),
            Container(
              height: 70,
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      _selectedDate == null
                          ? 'No Date Chosen!'
                          : 'Picked Date: ${DateFormat.yMd().format(_selectedDate as DateTime)}',
                    ),
                  ),
                  Platform.isIOS
                      ? CupertinoButton(
                          onPressed: _presentDatePicker,
                          child: Text(
                            "Choose Date",
                          ),
                        )
                      : TextButton(
                          onPressed: _presentDatePicker,
                          child: Text(
                            "Choose Date",
                          ),
                        )
                ],
              ),
            ),
            ElevatedButton(
              child: Text('Add Transaction'),
              onPressed: _submitData,
            )
          ]),
        ),
      ),
    );
  }
}
