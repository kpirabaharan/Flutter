import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:riverpod_app/models/event.dart';
import 'package:riverpod_app/providers/event_provider.dart';

import 'package:riverpod_app/widgets/item.dart';

class ItemList extends ConsumerWidget {
  const ItemList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AsyncValue<List<Event>> events = ref.watch(eventProvider);
    return events.when(
      data: (events) => Column(children: events.map((e) => Item(item: e)).toList()),
      error: (err, stack) => Center(child: Text('Error: $err')),
      loading: () => const Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
