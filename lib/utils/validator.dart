class Validator {
  // Validate if the text is not empty
  static String? validateEmpty(String? value) {
    value = value!.trim();
    if (value.isEmpty) {
      return 'This field cannot be empty';
    }
    return null;
  }

  // Validate if the text is a valid email format
  static String? validateEmail(String? value) {
    value = value!.trim();
    const emailPattern = r'^[a-zA-Z0-9]+@[a-zA-Z0-9]+\.[a-zA-Z]+';
    final regExp = RegExp(emailPattern);

    if (value.isEmpty) {
      return 'Email cannot be empty';
    } else if (!regExp.hasMatch(value)) {
      return 'Enter a valid email address';
    }
    return null;
  }

  // Validate if the password has a minimum length
  static String? validatePassword(String? value) {
    value = value!.trim();
    if (value.isEmpty) {
      return 'Password cannot be empty';
    } else if (value.length < 8) {
      return 'Password must be at least 8 characters long';
    }
    return null;
  }
}
