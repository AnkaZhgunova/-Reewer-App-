class Validator {
  static String? validatePhoneNumber(String? number) {
    if (number != null) {
      if (number.isEmpty) {
        return 'You did not fill out';
      }
    }

    return null;
  }

  static String? validatePinCode(String? pinCone) {
    if (pinCone != null) {
      if (pinCone.length < 4) {
        return 'Please enter a valid code';
      }
    }

    return null;
  }

  static String? validateEmail(String? email) {
    if (email != null) {
      if (email.isEmpty) {
        return 'You did not fill out';
      }
      if (!RegExp(
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
      ).hasMatch(email)) {
        return 'Please enter a valid email address';
      }
    }

    return null;
  }
}
