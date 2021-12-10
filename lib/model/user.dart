class User {
  String? _id;
  String? _email;
  String? _firstName;
  String? _lastName;
  String? _username;
  String? _avatarURL;

  User({
    String? id,
    String? email,
    String? firstName,
    String? lastName,
    String? username,
    String? avatarURL,
  })  : _id = id,
        _email = email,
        _firstName = firstName,
        _lastName = lastName,
        _username = username;
  // _avatarURL = avatarURL;

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
        id: json['user_id'] ?? '0',
        email: json['email'] as String? ?? '',
        firstName: json['first_name'] as String? ?? '',
        lastName: json['last_name'] as String? ?? '',
        username: json['username'] as String? ?? '',
        avatarURL: json['avatar_url'] as String? ?? '');
  }

  String? get id => _id;
  String? get email => _email;
  String? get firstName => _firstName;
  String? get lastName => _lastName;
  String? get username => _username;
  String? get avatarURL => _avatarURL;
}
