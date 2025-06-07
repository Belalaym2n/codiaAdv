class BlogFormValidator {
  static String? validateHeadline(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Please enter a headline';
    }
    return null;
  }

  static String? validateDescription(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Please enter a description';
    }
    if (value.length < 10) {
      return 'Description should be at least 10 characters';
    }
    return null;
  }

  static String? validateDate(DateTime? selectedDate) {
    if (selectedDate == null) {
      return 'Please choose a date';
    }
    return null;
  }
}
