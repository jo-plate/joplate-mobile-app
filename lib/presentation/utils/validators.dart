class Validators {
  static String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Email is required';
    }

    final emailRegExp = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    if (!emailRegExp.hasMatch(value)) {
      return 'Please enter a valid email';
    }

    return null;
  }

  static String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password is required';
    }

    if (value.length < 6) {
      return 'Password must be at least 6 characters';
    }

    return null;
  }

  static String? validateName(String? value) {
    if (value == null || value.isEmpty) {
      return 'Name is required';
    }

    if (value.length < 3) {
      return 'Name must be at least 3 characters';
    }

    return null;
  }

  static String? validateJordanianPhone(String? value) {
    if (value == null || value.isEmpty) {
      return 'Phone number is required';
    }

    // Remove any non-digit characters
    final digitsOnly = value.replaceAll(RegExp(r'\D'), '');
    
    // Remove any leading 0 if present
    final normalizedNumber = digitsOnly.startsWith('0') ? digitsOnly.substring(1) : digitsOnly;
    
    // Check if it starts with valid Jordanian prefixes
    if (!normalizedNumber.startsWith('7')) {
      return 'Number must start with 7';
    }
    
    final secondDigit = normalizedNumber.length > 1 ? normalizedNumber[1] : '';
    if (secondDigit != '7' && secondDigit != '8' && secondDigit != '9') {
      return 'Number must be 77, 78, or 79';
    }

    // Check for 9 digits total (without the leading 0)
    if (normalizedNumber.length != 9) {
      return 'Phone must be 9 digits (excluding country code)';
    }

    return null;
  }
}
