class SignUp {
  String? _username;
  String? _email;
  String? _password;
  String? _firstName;
  String? _lastName;
  String? _avatarurl;

  SignUp({
    String? email,
    String? firstName,
    String? lastName,
    String? username,
    String? password,
    String? avatarurl,
  })  : _email = email,
        _firstName = firstName,
        _lastName = lastName,
        _avatarurl = avatarurl,
        _username = username,
        _password = password;

  factory SignUp.fromJson(Map<String, dynamic> json) {
    return SignUp(
      email: json['email'] as String? ?? '',
      firstName: json['first_name'] as String? ?? '',
      lastName: json['last_name'] as String? ?? '',
      avatarurl: json['avatar_url'] as String? ?? '',
      username: json['username'] as String? ?? '',
      password: json['password'] as String? ?? '',
    );
  }

  String? get email => _email;
  String? get firstName => _firstName;
  String? get lastName => _lastName;
  String? get username => _username;
  String? get password => _password;
  String? get avatarurl => _avatarurl;

  Map<String, dynamic> signup() {
    return {
      "username": "$username",
      "password": "$password",
      "first_name": "$firstName",
      "last_name": "$lastName",
      "email": "$email",
      "avatar_url":
          "https://firebasestorage.googleapis.com/v0/b/flutter-additionals.appspot.com/o/avatar%2FBoy%20free%20vector%20icons%20designed%20by%20Freepik.png?alt=media&token=87a0d143-9077-435d-bfbd-c644aa5464c8",
    };
  }
}
