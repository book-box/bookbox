import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ProfileService {
  static const String _profileDoc = 'Profile';

  final String _uid = FirebaseAuth.instance.currentUser!.uid;
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Future<void> updateUserBio({required String bio}) async {
    await _db.collection(_uid).doc(_profileDoc).set({
      'Bio': bio
    });
  }
}