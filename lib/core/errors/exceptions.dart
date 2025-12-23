/// Base exception class for data layer errors
class AppException implements Exception {
  final String message;
  final String? code;

  const AppException(this.message, {this.code});

  @override
  String toString() => 'AppException: $message (code: $code)';
}

/// Server/API exceptions
class ServerException extends AppException {
  const ServerException(super.message, {super.code});
}

/// Firebase exceptions
class FirebaseAppException extends AppException {
  const FirebaseAppException(super.message, {super.code});
}

/// Authentication exceptions
class AuthException extends AppException {
  const AuthException(super.message, {super.code});
}

/// Cache exceptions
class CacheException extends AppException {
  const CacheException(super.message, {super.code});
}
