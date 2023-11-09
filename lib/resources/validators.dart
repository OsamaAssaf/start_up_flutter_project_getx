import '../main.dart';

class Validators {
  static String? validateEmail(String? value) {
    RegExp regex = RegExp(r'^[\w-]+(\.[\w-]+)*@([a-zA-Z0-9-]+\.)+[a-zA-Z]{2,7}$');
    if (value == null || value.isEmpty) {
      return localizations.pleaseEnterEmail;
    }
    if (!regex.hasMatch(value)) {
      return localizations.invalidEmail;
    }
    return null;
  }

  static String? validatePassword(String? value) {
    final uppercasePattern = RegExp(r'(?=.*[A-Z])');
    final lowercasePattern = RegExp(r'(?=.*[a-z])');
    final numberPattern = RegExp(r'(?=.*[0-9])');
    final symbolPattern = RegExp(r'(?=.*?[!@#\$&*~])');
    if (value == null || value.isEmpty) {
      return localizations.pleaseEnterPassword;
    }
    if (uppercasePattern.hasMatch(value) && lowercasePattern.hasMatch(value)) {
      return localizations.passwordMustContainUpperAndLower;
    }
    if (numberPattern.hasMatch(value)) {
      return localizations.passwordMustContainNumber;
    }
    if (symbolPattern.hasMatch(value)) {
      return localizations.passwordMustContainSymbol;
    }
    if (value.length < 8) {
      return localizations.passwordMustBeMoreThatEight;
    }
    return null;
  }

  static String? validateConfirmPassword(String? value, String password) {
    if (value == null || value.isEmpty) {
      return localizations.pleaseEnterConfirmPassword;
    }
    if (value != password) {
      return localizations.passwordDoesNotMatch;
    }
    return null;
  }

  static String? validatePhone(String? value) {
    RegExp regex = RegExp(r'^\+?[0-9]{8,}$');
    if (value == null || value.isEmpty) {
      return localizations.pleaseEnterPhone;
    }
    if (!regex.hasMatch(value)) {
      return localizations.invalidPhoneNumber;
    }
    return null;
  }
}
