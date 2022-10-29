import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transaction.dart';
import './chart_bar.dart';

class Chart extends StatelessWidget {
  final List<Transaction> recentTransactions;

  Chart(this.recentTransactions);

  List<Map<String, Object>> get lastSevenDaysTransaction {
    return List.generate(7, (index) {
      // Neet trick to get current weekday and subtract
      final weekDay = DateTime.now().subtract(Duration(days: index));

      var totalSum = 0.0;

      // Can declare for loops in c style or python style with a var
      for (var tx in recentTransactions) {
        if (tx.date.day == weekDay.day &&
            tx.date.month == weekDay.month &&
            tx.date.year == weekDay.year) {
          totalSum += tx.amount;
        }
      }

      return {
        'day': DateFormat.E().format(weekDay).substring(0, 1),
        'amount': totalSum
      };
    }).reversed.toList();
  }

  double get sumSpending {
    return lastSevenDaysTransaction.fold(0.0, (sum, item) {
      return sum + (item['amount'] as double);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      margin: EdgeInsets.all(20),
      child: Container(
        padding: EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: lastSevenDaysTransaction.map(
            (data) {
              return Flexible(
                fit: FlexFit.tight,
                child: ChartBar(
                    label: (data['day'] as String),
                    spendingAmount: (data['amount'] as double),
                    spendingPctofTotal: sumSpending == 0
                        ? 0.0
                        : (data['amount'] as double) / sumSpending),
              );
              //return Text('${el['day']} : ${el['amount']}');
            },
          ).toList(),
        ),
      ),
    );
  }
}
