abstract class ValidationTextField {
  static emailInput(String? value) {
    if (value == null || value.isEmpty) {
      return "Please Enter Email";
    } else {
      return;
    }
  }

  static passwordInput(String? value) {
    if (value == null || value.isEmpty) {
      return "Please Enter Password";
    } else {
      return;
    }
  }
}
