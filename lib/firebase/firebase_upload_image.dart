import 'dart:io';
import 'dart:typed_data';
import 'package:firebase_storage/firebase_storage.dart';

class UploadFireBaseStorage {
  static Future<UploadTask?> uploadBytes(
      String destination, Uint8List data, String user_id, String filename) {
    try {
      //  final ref = FirebaseStorage.instance.ref(destination);
      //final ref = FirebaseStorage.instanceFor().ref();

      final ref = FirebaseStorage.instance.ref().child(user_id).child(filename);
      print(destination);
      return Future.value(ref.putData(data));
    } catch (e) {
      print(e);
      return Future.value(null);
    }
  }
}
