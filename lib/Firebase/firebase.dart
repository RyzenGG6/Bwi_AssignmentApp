import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:firebase_storage/firebase_storage.dart';

Future<Map<String, dynamic>> getData() async {
  Map<String, dynamic> data = {};
  // Reference to your Firestore collection
  final CollectionReference collection =
  FirebaseFirestore.instance.collection('banner'); // Replace with your actual collection name

  // Query the documents in the collection
  QuerySnapshot snapshot = await collection.get();

  // Loop through the documents and access the specific fields
  for (QueryDocumentSnapshot document in snapshot.docs) {
    data = document.data() as Map<String, dynamic>;
    // Access the specific fields
  }
  return data;
}
final FirebaseStorage _storage = FirebaseStorage.instance;

Future<String> getImageUrl(String imageName) async {
  try {
    final ref = firebase_storage.FirebaseStorage.instance.ref().child(imageName);
    final url = await ref.getDownloadURL();
    return url;
  } catch (e) {
    print('Error getting image URL: $e');
    return ''; // Return an empty string or handle the error as needed
  }
}