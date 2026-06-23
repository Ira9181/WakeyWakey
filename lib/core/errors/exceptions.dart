/// Exceptions are thrown in the DATA layer.
/// They get caught and converted to Failures in the repository.

class DatabaseException implements Exception {
  final String message;
  const DatabaseException({required this.message});

  @override
  String toString() => 'DatabaseException: $message';
}

class PermissionException implements Exception {
  final String message;
  const PermissionException({required this.message});
}

class AIServiceException implements Exception {
  final String message;
  const AIServiceException({required this.message});
}
