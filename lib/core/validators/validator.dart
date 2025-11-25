class AppValidators {
  //validate empty
  static String? requiredField(String? value, {String fieldName = "This field"}) {
    if (value == null || value.trim().isEmpty) {
      return "$fieldName is required";
    }
    return null;
  }

  //validate Email
  static String? email(String? value) {
    if (value == null || value.trim().isEmpty) {
      return "Email is required";
    }
    final regex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    if (!regex.hasMatch(value)) {
      return "Enter a valid email address";
    }
    return null;
  }

  //validate number
  static String? number(String? value, {String fieldName = "Number"}) {
    if (value == null || value.trim().isEmpty) {
      return "$fieldName is required";
    }
    if (double.tryParse(value) == null) {
      return "$fieldName must be a valid number";
    }
    return null;
  }
}