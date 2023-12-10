class ValidatorUtil {
  static String? validateCode(String? value) {
    value = value!.replaceAll(RegExp(' +'), ' ').trim();
    if (value.isEmpty) {
      return "Please enter valid code";
    } else {
      return null;
    }
  }

  static String? validatePhone(String? value) {
    String pattern = r'(^[0-9]*$)';
    RegExp regex = RegExp(pattern);
    value = value!.replaceAll(RegExp(' +'), ' ').trim();
    if (value.isEmpty) {
      return "Please enter phone number";
    } else if (value.length != 10) {
      return "Please enter valid phone number";
    } else if (!regex.hasMatch(value)) {
      return "Please enter valid phone number";
    } else {
      return null;
    }
  }

  static String? validateOtp(String? value) {
    String pattern = r'(^[0-9]*$)';
    RegExp regex = RegExp(pattern);
    value = value!.replaceAll(RegExp(' +'), ' ').trim();
    if (value.isEmpty) {
      return "Please enter valid Otp";
    } else if (value.length != 6) {
      return "Please enter valid Otp";
    } else if (!regex.hasMatch(value)) {
      return "Please enter valid Otp";
    } else {
      return null;
    }
  }

  static String? validateText(String? value) {
    if (value!.isEmpty) {
      return 'Please enter a valid value';
    } else {
      return null;
    }
  }

  static String? validateCampaignName(String? value) {
    if (value!.isEmpty) {
      return 'Please enter a valid Campaign name';
    } else {
      return null;
    }
  }

  static String? validateAmount(String? value) {
    if (value!.isEmpty || int.parse(value) < 1) {
      return 'Invalid amount';
    } else {
      return null;
    }
  }
}
