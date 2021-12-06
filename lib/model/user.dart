//import 'dart:typed_data';

class User {
  String? _id;
  String? _firstName;
  String? _lastName;
  String? _email;
  //Uint8List? _image;

  User({
    String? id,
    String? firstName,
    String? lastName,
    String? email,
    //Uint8List? image,
  }) {
    _id = id;
    _firstName = firstName;
    _lastName = lastName;
    //_image = image;
    _email = email;
  }
  String? get id => _id;
  String? get firstName => _firstName;
  String? get lastName => _lastName;
  String? get email => _email;
  //Uint8List? get image => _image;
}
