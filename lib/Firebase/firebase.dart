import 'package:cloud_firestore/cloud_firestore.dart';
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

Future<Map<String, dynamic>> getImageUrls() async {
  Map<String, String> imageUrls = {};

  try {
    final ref = FirebaseStorage.instance.ref().child('banner.png');
    var url = await ref.getDownloadURL();
    imageUrls['banner.png']=url;
  } catch (error) {
    print('Error fetching image URLs: $error');
  }

  return imageUrls;
}