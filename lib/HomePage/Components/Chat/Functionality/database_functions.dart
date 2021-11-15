import 'package:cloud_firestore/cloud_firestore.dart';

class Databasefunction {
  uploaduserInfo(userMap) {
    Firestore.instance.collection("users").document().setData(userMap);
  }

  getusername(String username) async {
    return await Firestore.instance
        .collection("users")
        .where("name", isEqualTo: username)
        .getDocuments();
  }
}
