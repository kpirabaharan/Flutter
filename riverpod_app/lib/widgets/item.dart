import 'package:flutter/material.dart';

import 'package:riverpod_app/models/event.dart';

class Item extends StatelessWidget {
  const Item({Key? key, required this.item}) : super(key: key);

  final Event item;

  @override
  Widget build(BuildContext context) {
    return Text(item.title);
  }
}
