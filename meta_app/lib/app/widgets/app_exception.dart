import 'package:hooks_riverpod/hooks_riverpod.dart';

class AppException implements Exception {
  final String message;
  AppException({required this.message});

  @override
  String toString() {
    return message;
  }
}
