abstract final class Validators {
  static String? validateRequired(String? value, {String fieldName = 'Field'}) {
    if (value == null || value.trim().isEmpty) {
      return '$fieldName is required.';
    }
    return null;
  }

  static String? validateDisplayName(String? value) {
    final error = validateRequired(value, fieldName: 'Name');
    if (error != null) {
      return error;
    }

    if (value!.trim().length < 2) {
      return 'Name must be at least 2 characters.';
    }

    return null;
  }
}
