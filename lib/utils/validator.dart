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

  static String? validateFullName(String? name) {
    if (name != null) {
      if (name.isEmpty) {
        return 'You did not fill out';
      }
      if (name.length < 2 || name.length > 30) {
        return 'Please enter a valid name';
      }
      if (name.contains(RegExp('[0-9]'))) {
        return 'Please enter a valid name';
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

  static String? validateAddress(String? address) {
    if (address != null) {
      if (address.isEmpty) {
        return 'You did not fill out';
      }
    }

    return null;
  }
}
