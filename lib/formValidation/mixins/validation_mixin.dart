class validationMixin {
  String? validateEmail(value) {
    if (!value!.contains('@')) {
      return 'Please enter a valid email';
    }
    return null;
  }

  String? validatePassword(value) {
    if (value!.isEmpty) {
      return 'password cannot be empty';
    }
    if (value.length < 4) {
      return 'minimum 4 characters required';
    }
    return null;
  }
}
