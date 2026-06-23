import 'package:equatable/equatable.dart';

/// Base class for all failures in the app.
/// Using Equatable so we can compare failures in tests.
abstract class Failure extends Equatable {
  final String message;

  const Failure({required this.message});

  @override
  List<Object> get props => [message];
}

/// Failure when database operations fail
class DatabaseFailure extends Failure {
  const DatabaseFailure({required super.message});
}

/// Failure when a required permission is denied
class PermissionFailure extends Failure {
  const PermissionFailure({required super.message});
}

/// Failure when AI service is unavailable
class AIServiceFailure extends Failure {
  const AIServiceFailure({required super.message});
}

/// Failure when alarm scheduling fails
class AlarmSchedulingFailure extends Failure {
  const AlarmSchedulingFailure({required super.message});
}

/// Failure for unexpected/unknown errors
class UnexpectedFailure extends Failure {
  const UnexpectedFailure({required super.message});
}
