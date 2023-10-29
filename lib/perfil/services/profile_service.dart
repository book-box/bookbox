import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ProfileService {
  static const String _profileDoc = 'Profile';
  static const String _mostLiked = 'MostLiked';

  final String _uid = FirebaseAuth.instance.currentUser!.uid;
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Future<void> updateUserBio({required String bio}) async {
    await _db.collection(_uid).doc(_profileDoc).set({
      'Bio': bio
    });
  }

  Future<String> getUserBio() async {
    try {
      final doc = await _db.collection(_uid).doc(_profileDoc).get();
      return doc.get('Bio');
    } catch (e) {
      return 'Error: $e';
    }
  }

  Future<void> updateFavoriteBooks({required List<String> favoriteBooks}) async {
    await _db.collection(_uid).doc(_profileDoc).set({
      'FavoriteBooks': favoriteBooks
    });
  }

  Future<List<String>> getFavoriteBooks() async {
    try {
      final doc = await _db.collection(_uid).doc(_profileDoc).get();
      return List<String>.from(doc.get('FavoriteBooks'));
    } catch (e) {
      return ['Error: $e'];
    }
  }

  Future<void> fetchLike({required String liked}) async {
    final like = await _db.collection(_uid).doc(_mostLiked).get();
    final List<String> likeList = List<String>.from(like.get('Liked'));
    likeList.add(liked);
    await _db.collection(_uid).doc(_mostLiked).set({
      'Liked': likeList
    });
  }

}