import 'package:cloud_firestore/cloud_firestore.dart';

class HomeService {
  final CollectionReference _categoryCollectionRef =
      FirebaseFirestore.instance.collection("categories");
  final CollectionReference _productCollectionRef =
      FirebaseFirestore.instance.collection("products");

  Future<List<QueryDocumentSnapshot>> getCategory() async {
    var data = await _categoryCollectionRef.get();
    return data.docs;
  }

  Future<List<QueryDocumentSnapshot>> getBestSelling() async {
    var data = await _productCollectionRef.get();
    return data.docs;
  }
} // HomeService
