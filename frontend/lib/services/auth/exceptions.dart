class AuthException implements Exception {
  late String message;
}

// LOGIN EXCEPTIONS
class AccountAlreadyExistsException implements AuthException {
  @override
  String message = "An account already exists with this email";
}

class AccountDoesNotExistException implements AuthException {
  @override
  String message = "No account exists with this email";
}

class AccountDisabledException implements AuthException {
  @override
  String message = "This account has been disabled";
}

class WrongPasswordException implements AuthException {
  @override
  String message = "Invalid password";
}

// REGISTER EXCEPTIONS
class WeakPasswordException implements AuthException {
  @override
  String message = "Weak password";
}

class EmailAlreadyInUseException implements AuthException {
  @override
  String message = "Email entered is already in use";
}

class UnknownException implements AuthException {
  @override
  String message = "An unknown auth exception occured";
}
