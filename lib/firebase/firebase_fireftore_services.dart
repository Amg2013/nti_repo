import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseFirestoreServices {
  FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  // create a collection reference
  CollectionReference getCollectionReference(String collectionPath) {
    return _firebaseFirestore.collection(collectionPath);
  }

  CollectionReference get colthes => _firebaseFirestore.collection('clothes');

  //
  CollectionReference<Map<String, dynamic>> get products =>
      _firebaseFirestore.collection('products');

  ///
  final user = FirebaseFirestore.instance.collection('users');

  Future<void> addUser(String name, String email) {
    return user.add({'name': name, 'email': email});
  }

  // create
  // read
  // update
  // delete
}
