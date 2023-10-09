import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:riverpod_app/models/event.dart';
import 'package:riverpod_app/providers/event_provider.dart';

class AddItem extends ConsumerWidget {
  const AddItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ElevatedButton(
      onPressed: () {
        ref.read(eventProvider.notifier).addEvent(
              Event(
                  id: 'e4',
                  title: 'Nerd Alert',
                  description: 'Coding in Basement',
                  location: 'Ottawa, ON',
                  date: '2023-10-09',
                  image: 'images/image_1.jpeg',
                  isFeatured: false),
            );
      },
      child: const Text('Add Item'),
    );
  }
}
