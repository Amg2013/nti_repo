import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseFirestoreServices {
   static FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

  // create a collection reference
  CollectionReference getCollectionReference(String collectionPath) {
    return firebaseFirestore.collection(collectionPath);
  }

  static CollectionReference get clothes => firebaseFirestore.collection('clothes');

  //
  static CollectionReference<Map<String, dynamic>> get products =>
      firebaseFirestore.collection('products');

  ///
  final user = FirebaseFirestore.instance.collection('users');

  Future<void> addUser(String name, String email) {
    return user.add({'name': name, 'email': email});
  }

  // create
  static addDoc() async {
    await clothes.add({
      'brand': 'ZARA',
      'type': 'Shirts',
      'price': 1499,
    });
  }

  static updateDocOrCreateIfNotExists(String docId) async {
    await clothes.doc(docId).set({
      'brand': 'SUTRA',
      'type': 'Pants',
      'price': 999,
    });
  }
  
  // read
  static readDoc(String docId) async {
    final snapshot = await clothes.doc(docId).get();
    if (snapshot.exists) {
      return snapshot.data();
    } else {
      print('Document does not exist');
      return null;
    }
  }
  // update
  static updateDoc(String docId) async {
    await clothes.doc(docId).update({
      'price': 1999,
    });
  }
  // delete
  static deleteDoc(String docId) async {
    await clothes.doc(docId).delete();
  }
}
