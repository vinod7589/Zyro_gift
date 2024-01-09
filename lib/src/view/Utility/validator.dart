class Validator {
  static String? validateEmail(String value) {
    // Pattern pattern = r'^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+';
    // RegExp regex =  RegExp(pattern as String);
    // if (!regex.hasMatch(value)) {
    //   return '🚩 Please enter a valid email address.';
    // } else {
    //   return null;
    // }
    bool emailvalid = RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(value);
    if (value.isEmpty) {
      return 'Email is required.';
    } else if (!emailvalid) {
      return 'Please enter a valid email address.';
    }
    return null;
  }

  static String? validateDropDefaultData(value) {
    if (value == null) {
      return 'Please select an item.';
    } else {
      return null;
    }
  }

  static String? validatePassword(String value, int length) {
    if (value.isEmpty) {
      return 'This Field is required.';
    }
    Pattern pattern = r'^.{' + length.toString() + r',}$';
    RegExp regex = RegExp(pattern as String);
    if (!regex.hasMatch(value)) {
      return 'Password must be at least ' + length.toString() + ' characters.';
    } else {
      return null;
    }
  }

  static String? validateName(String value, int lenth, String? name) {
    name = name == null ? 'This field' : name;
    if (value.isEmpty) {
      return name + ' is required.';
    } else if (value.length < lenth) {
      return name +
          ' must contain at least ' +
          lenth.toString() +
          ' characters.';
    } else {
      return null;
    }
  }

  static String? validateText(String value, String? name) {
    name = name == null ? 'This field' : name;
    if (value.isEmpty) {
      return name + ' is required.';
    } else {
      return null;
    }
  }

  static String? validateAmount(String? value) {
    if (value == null || value == '') {
      return 'Please enter the amount.';
    } else if (num.parse(value) < 1) {
      return 'Amount must not be less than 1.';
    } else {
      return null;
    }
  }

  static String? phone(String value) {
    final nob = int.tryParse(value);
    if (nob != null) {
      if (value.length == 10) {
        return null;
      } else {
        return 'Mobile no. must be of 10 digit.';
      }
    } else {
      return 'Not a Valid mobile no.';
    }
  }
}
