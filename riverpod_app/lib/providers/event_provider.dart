import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_app/models/event.dart';
import 'package:dio/dio.dart';

final dio = Dio();

final eventProvider = FutureProvider.autoDispose<List<Event>>((ref) async {
  final response = await dio.get('http://localhost:3007/events');
  return (response.data as List).map((e) => Event.fromJson(e as Map<String, dynamic>)).toList();
});
