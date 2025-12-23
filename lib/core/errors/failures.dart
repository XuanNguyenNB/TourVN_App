import 'package:fpdart/fpdart.dart';

/// Base failure class for domain layer errors
sealed class Failure {
  final String message;
  final String? code;

  const Failure(this.message, {this.code});
}

/// Server/Network related failures
class ServerFailure extends Failure {
  const ServerFailure(super.message, {super.code});
}

/// Firebase related failures
class FirebaseFailure extends Failure {
  const FirebaseFailure(super.message, {super.code});
}

/// Authentication failures
class AuthFailure extends Failure {
  const AuthFailure(super.message, {super.code});
}

/// Cache/Local storage failures
class CacheFailure extends Failure {
  const CacheFailure(super.message, {super.code});
}

/// Validation failures
class ValidationFailure extends Failure {
  const ValidationFailure(super.message, {super.code});
}

/// Permission failures
class PermissionFailure extends Failure {
  const PermissionFailure(super.message, {super.code});
}

/// Type alias for Either with Failure
typedef ResultFuture<T> = Future<Either<Failure, T>>;
typedef ResultVoid = ResultFuture<void>;
