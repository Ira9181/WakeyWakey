import 'package:dartz/dartz.dart';
import '../errors/failures.dart';

/// Base class for all use cases.
/// [Type] = the return type on success (e.g., List<AlarmEntity>)
/// [Params] = the input parameters (e.g., CreateAlarmParams)
abstract class UseCase<Type, Params> {
  Future<Either<Failure, Type>> call(Params params);
}

/// Used when a use case needs no parameters.
/// Example: GetAlarms doesn't need any input.
class NoParams {
  const NoParams();
}
