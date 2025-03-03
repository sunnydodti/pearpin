import 'dart:math';

class PasswordService {
  static const String _lowerCaseChars = 'abcdefghijklmnopqrstuvwxyz';
  static const String _upperCaseChars = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
  static const String _numberChars = '0123456789';
  static const String _specialChars = '!@#\$%^&*()_-+={}[]|;:<>,.?/~';

  static String generatePassword({
    int length = 12,
    bool includeLowercase = true,
    bool includeUppercase = true,
    bool includeNumbers = true,
    bool includeSpecial = true,
  }) {
    String allowedChars = '';
    if (includeLowercase) allowedChars += _lowerCaseChars;
    if (includeUppercase) allowedChars += _upperCaseChars;
    if (includeNumbers) allowedChars += _numberChars;
    if (includeSpecial) allowedChars += _specialChars;

    if (allowedChars.isEmpty) {
      return '';
    }

    final random = Random.secure();
    return List.generate(
        length, (index) => allowedChars[random.nextInt(allowedChars.length)])
        .join();
  }
}
