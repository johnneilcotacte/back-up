class User {
  int _id;
  String? _email;
  String? _firstName;
  String? _lastName;
  // String? _avatarURL;

  User({
    required int id,
    String? email,
    String? firstName,
    String? lastName,
    String? avatarURL,
  })  : _id = id,
        _email = email,
        _firstName = firstName,
        _lastName = lastName;
  // _avatarURL = avatarURL;

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: int.parse((json['id'] ?? '0').toString()),
      email: json['email'] as String? ?? '',
      firstName: json['first_name'] as String? ?? '',
      lastName: json['last_name'] as String? ?? '',
      // avatarURL: json['avatar'] as String? ?? ''
    );
  }

  int get id => _id;
  String? get email => _email;
  String? get firstName => _firstName;
  String? get lastName => _lastName;
  // String? get avatarURL => _avatarURL;
}
