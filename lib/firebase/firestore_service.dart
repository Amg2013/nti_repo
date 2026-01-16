import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {
  static final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  /// CREATE - Add a new document to a collection
  static Future<DocumentReference> addDocument({
    required String collection,
    required Map<String, dynamic> data,
  }) async {
    try {
      final docRef = await _firestore.collection(collection).add({
        ...data,
        // 'createdAt': FieldValue.serverTimestamp(),
        // 'updatedAt': FieldValue.serverTimestamp(),
      });
      return docRef;
    } catch (e) {
      throw Exception('Failed to add document: $e');
    }
  }

  /// CREATE - Set a document with a specific ID
  static Future<void> setDocument({
    required String collection,
    required String docId,
    required Map<String, dynamic> data,
    bool merge = false,
  }) async {
    try {
      await _firestore.collection(collection).doc(docId).set({
        ...data,
        'createdAt': FieldValue.serverTimestamp(),
        'updatedAt': FieldValue.serverTimestamp(),
      }, SetOptions(merge: merge));
    } catch (e) {
      throw Exception('Failed to set document: $e');
    }
  }

  /// READ - Get a single document by ID
  static Future<Map<String, dynamic>?> getDocument({
    required String collection,
    required String docId,
  }) async {
    try {
      final doc = await _firestore.collection(collection).doc(docId).get();
      return doc.data();
    } catch (e) {
      throw Exception('Failed to fetch document: $e');
    }
  }

  /// READ - Get all documents from a collection
  static Future<List<Map<String, dynamic>>> getAllDocuments({
    required String collection,
  }) async {
    try {
      final snapshot = await _firestore.collection(collection).get();
      /*

map<int x ,dynamic y> = {
  'x': doc.id,
  
   ...doc.data()}
*/
      ///
      ///
      return snapshot.docs.map((doc) => {'id': doc.id, ...doc.data()}).toList();
    } catch (e) {
      throw Exception('Failed to fetch documents: $e');
    }
  }

  /// READ - Query documents with conditions
  static Future<List<Map<String, dynamic>>> queryDocuments({
    required String collection,
    required String field,
    required dynamic value,
    String? operator = '==',
  }) async {
    try {
      Query query = _firestore.collection(collection);

      switch (operator) {
        case '==':
          query = query.where(field, isEqualTo: value);
          break;
        case '<':
          query = query.where(field, isLessThan: value);
          break;
        case '<=':
          query = query.where(field, isLessThanOrEqualTo: value);
          break;
        case '>':
          query = query.where(field, isGreaterThan: value);
          break;
        case '>=':
          query = query.where(field, isGreaterThanOrEqualTo: value);
          break;
        case '!=':
          query = query.where(field, isNotEqualTo: value);
          break;
        case 'array-contains':
          query = query.where(field, arrayContains: value);
          break;
        case 'in':
          query = query.where(field, whereIn: value);
          break;
        default:
          query = query.where(field, isEqualTo: value);
      }

      final snapshot = await query.get();
      return snapshot.docs
          .map((doc) => {'id': doc.id, ...doc.data() as Map<String, dynamic>})
          .toList();
    } catch (e) {
      throw Exception('Failed to query documents: $e');
    }
  }

  /// READ - Get documents with multiple conditions
  static Future<List<Map<String, dynamic>>> getDocumentsWhere({
    required String collection,
    required List<Map<String, dynamic>> conditions,
  }) async {
    try {
      Query query = _firestore.collection(collection);

      for (var condition in conditions) {
        final field = condition['field'] as String;
        final operator = condition['operator'] as String? ?? '==';
        final value = condition['value'];

        switch (operator) {
          case '==':
            query = query.where(field, isEqualTo: value);
            break;
          case '<':
            query = query.where(field, isLessThan: value);
            break;
          case '<=':
            query = query.where(field, isLessThanOrEqualTo: value);
            break;
          case '>':
            query = query.where(field, isGreaterThan: value);
            break;
          case '>=':
            query = query.where(field, isGreaterThanOrEqualTo: value);
            break;
          case 'array-contains':
            query = query.where(field, arrayContains: value);
            break;
        }
      }

      final snapshot = await query.get();
      return snapshot.docs
          .map((doc) => {'id': doc.id, ...doc.data() as Map<String, dynamic>})
          .toList();
    } catch (e) {
      throw Exception('Failed to fetch documents with conditions: $e');
    }
  }

  /// UPDATE - Update specific fields in a document
  static Future<void> updateDocument({
    required String collection,
    required String docId,
    required Map<String, dynamic> data,
  }) async {
    try {
      await _firestore.collection(collection).doc(docId).update({
        ...data,
        'updatedAt': FieldValue.serverTimestamp(),
      });
    } catch (e) {
      throw Exception('Failed to update document: $e');
    }
  }

  /// UPDATE - Increment a numeric field
  static Future<void> incrementField({
    required String collection,
    required String docId,
    required String field,
    required num value,
  }) async {
    try {
      await _firestore.collection(collection).doc(docId).update({
        field: FieldValue.increment(value),
        'updatedAt': FieldValue.serverTimestamp(),
      });
    } catch (e) {
      throw Exception('Failed to increment field: $e');
    }
  }

  /// UPDATE - Add element to array field
  static Future<void> addToArray({
    required String collection,
    required String docId,
    required String field,
    required dynamic value,
  }) async {
    try {
      await _firestore.collection(collection).doc(docId).update({
        field: FieldValue.arrayUnion([value]),
        'updatedAt': FieldValue.serverTimestamp(),
      });
    } catch (e) {
      throw Exception('Failed to add to array: $e');
    }
  }

  /// UPDATE - Remove element from array field
  static Future<void> removeFromArray({
    required String collection,
    required String docId,
    required String field,
    required dynamic value,
  }) async {
    try {
      await _firestore.collection(collection).doc(docId).update({
        field: FieldValue.arrayRemove([value]),
        'updatedAt': FieldValue.serverTimestamp(),
      });
    } catch (e) {
      throw Exception('Failed to remove from array: $e');
    }
  }

  /// DELETE - Delete a document
  static Future<void> deleteDocument({
    required String collection,
    required String docId,
  }) async {
    try {
      await _firestore.collection(collection).doc(docId).delete();
    } catch (e) {
      throw Exception('Failed to delete document: $e');
    }
  }

  /// DELETE - Delete a field from a document
  static Future<void> deleteField({
    required String collection,
    required String docId,
    required String field,
  }) async {
    try {
      await _firestore.collection(collection).doc(docId).update({
        field: FieldValue.delete(),
      });
    } catch (e) {
      throw Exception('Failed to delete field: $e');
    }
  }

  /// DELETE - Delete all documents in a collection
  static Future<void> deleteCollection({required String collection}) async {
    try {
      final snapshot = await _firestore.collection(collection).get();
      for (var doc in snapshot.docs) {
        await doc.reference.delete();
      }
    } catch (e) {
      throw Exception('Failed to delete collection: $e');
    }
  }

  /// STREAM - Real-time listener for a single document
  static Stream<Map<String, dynamic>?> streamDocument({
    required String collection,
    required String docId,
  }) {
    try {
      return _firestore
          .collection(collection)
          .doc(docId)
          .snapshots()
          .map((snapshot) => snapshot.data());
    } catch (e) {
      throw Exception('Failed to stream document: $e');
    }
  }

  /// STREAM - Real-time listener for all documents in a collection
  static Stream<List<Map<String, dynamic>>> streamCollection({
    required String collection,
  }) {
    try {
      return _firestore
          .collection(collection)
          .snapshots()
          .map(
            (snapshot) =>
                snapshot.docs
                    .map((doc) => {'id': doc.id, ...doc.data()})
                    .toList(),
          );
    } catch (e) {
      throw Exception('Failed to stream collection: $e');
    }
  }

  /// STREAM - Real-time listener with query
  static Stream<List<Map<String, dynamic>>> streamQuery({
    required String collection,
    required String field,
    required dynamic value,
  }) {
    try {
      return _firestore
          .collection(collection)
          .where(field, isEqualTo: value)
          .snapshots()
          .map(
            (snapshot) =>
                snapshot.docs
                    .map((doc) => {'id': doc.id, ...doc.data()})
                    .toList(),
          );
    } catch (e) {
      throw Exception('Failed to stream query: $e');
    }
  }

  /// BATCH - Perform multiple operations atomically
  static Future<void> batch({
    required Function(WriteBatch batch) operations,
  }) async {
    try {
      final batch = _firestore.batch();
      await operations(batch);
      await batch.commit();
    } catch (e) {
      throw Exception('Batch operation failed: $e');
    }
  }

  /// COUNT - Get the number of documents in a collection
  static Future<int> countDocuments({required String collection}) async {
    try {
      final snapshot = await _firestore.collection(collection).count().get();
      return snapshot.count ?? 0;
    } catch (e) {
      throw Exception('Failed to count documents: $e');
    }
  }

  /// Check if document exists
  static Future<bool> documentExists({
    required String collection,
    required String docId,
  }) async {
    try {
      final doc = await _firestore.collection(collection).doc(docId).get();
      return doc.exists;
    } catch (e) {
      throw Exception('Failed to check document existence: $e');
    }
  }
}
