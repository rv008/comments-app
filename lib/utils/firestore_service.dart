import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  // Add data to a collection
  Future<void> addData({
    required String collectionPath,
    required Map<String, dynamic> data,
    String? documentId,
  }) async {
    try {
      if (documentId != null) {
        await _db.collection(collectionPath).doc(documentId).set(data);
      } else {
        await _db.collection(collectionPath).add(data);
      }
    } catch (e) {
      throw Exception('Error adding data: $e');
    }
  }

  // Retrieve a single document from a collection
  Future<Map<String, dynamic>?> getData({
    required String collectionPath,
    required String documentId,
  }) async {
    try {
      DocumentSnapshot docSnapshot =
          await _db.collection(collectionPath).doc(documentId).get();
      if (docSnapshot.exists) {
        return {
          'id': docSnapshot.id,
          ...docSnapshot.data() as Map<String, dynamic>
        };
      } else {
        return null;
      }
    } catch (e) {
      throw Exception('Error retrieving document: $e');
    }
  }
}
