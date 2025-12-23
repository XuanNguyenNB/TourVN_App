import 'package:fpdart/fpdart.dart';
import 'package:tourvn_app/core/errors/failures.dart';

/// Common type definitions used across the app

/// Result type for operations that can fail
typedef Result<T> = Either<Failure, T>;

/// Future result type for async operations that can fail
typedef ResultFuture<T> = Future<Either<Failure, T>>;

/// Void result type for operations that don't return a value
typedef ResultVoid = ResultFuture<void>;

/// JSON map type
typedef JsonMap = Map<String, dynamic>;
