class Check {
  //https://stackoverflow.com/questions/16800540/validate-email-address-in-dart
  static bool email(String email) {
    bool emailValidity = RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(email);
    return emailValidity;
  }

//https://stackoverflow.com/questions/5142103/regex-to-validate-password-strength
  static bool password(String password) {
    bool passwordStrength = RegExp(
            r"^(?=(.*[a-z]){3,})(?=(.*[A-Z]){2,})(?=(.*[0-9]){2,})(?=(.*[!@#$%^&*()\-__+.]){1,}).{8,}$")
        .hasMatch(password);
    return passwordStrength;
  }
}
