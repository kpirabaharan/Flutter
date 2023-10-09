import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_app/models/event.dart';
import 'package:dio/dio.dart';

final dio = Dio();

final eventProvider = AsyncNotifierProvider.autoDispose<EventList, List<Event>>(
  EventList.new,
);

class EventList extends AutoDisposeAsyncNotifier<List<Event>> {
  @override
  FutureOr<List<Event>> build() async {
    final response = await dio.get('http://localhost:3007/events');
    return (response.data as List).map((e) => Event.fromJson(e as Map<String, dynamic>)).toList();
  }

  Future<void> addEvent(Event event) async {
    final response = await dio.post(
      'http://localhost:3007/events',
      options: Options(contentType: 'application/json'),
      data: event.toJson(),
    );

    AsyncValue<List<Event>> currentState = state;

    Event newEvent = Event.fromJson(response.data as Map<String, dynamic>);

    List<Event> newState = [...currentState.value!, newEvent];

    state = AsyncData(newState);
  }
}
