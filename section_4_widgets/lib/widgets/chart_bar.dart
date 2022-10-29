import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  final String label;
  final double spendingAmount;
  final double spendingPctofTotal;

  ChartBar(
      {required this.label,
      required this.spendingAmount,
      required this.spendingPctofTotal});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(children: [
        Container(
            height: 20,
            child: FittedBox(
                child: Text('\$${spendingAmount.toStringAsFixed(0)}'))),
        SizedBox(
          height: 4,
        ),
        Container(
          height: 60,
          width: 10,
          child: Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey, width: 1),
                    color: Theme.of(context).primaryColorLight,
                    borderRadius: BorderRadius.circular(10)),
              ),
              FractionallySizedBox(
                heightFactor: spendingPctofTotal,
                child: Container(
                    decoration: BoxDecoration(
                        color: Theme.of(context).primaryColorDark,
                        borderRadius: BorderRadius.circular(10))),
              )
            ],
          ),
        ),
        SizedBox(
          height: 4,
        ),
        Text(label),
      ]),
    );
  }
}