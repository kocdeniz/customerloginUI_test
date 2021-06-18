class ValidationMixin {
  String? validateFirstName(String? value) {
    if (value != null && value.length < 2) {
      return "at least 2 characters please";
    }
  }

  String? validateLastName(String? value) {
    if (value != null && value.length < 2) {
      return "at least 2 characters please";
    }
  }

  String? validateEmail(String? value) {
    if (value != null && !value.contains("@")) {
      return "mail is not valid";
    }
  }
}
