String? validatePassword(String? value) {
  return value == null || value.length < 6 ? 'Password is too short.' : null;
}

// const RegExp emailRegex =
String? validateEmail(String? value) {
  bool isValid = value != null &&
      RegExp(r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
          .hasMatch(value);
  return isValid ? null : 'Email is invalid.';
}
