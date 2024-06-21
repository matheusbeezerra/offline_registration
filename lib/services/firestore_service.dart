import 'package:app_offline/data/models/item.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Future<List<Item>> fetchItems() async {
    QuerySnapshot snapshot = await _db.collection('items').get();
    return snapshot.docs.map((doc) => Item.fromFirestore(doc.data() as Map<String, dynamic>, doc.id)).toList();
  }

  Future<void> addItem(Item item) async {
    await _db.collection('items').add(item.toFirestore());
  }

  Future<void> updateItem(Item item) async {
    await _db.collection('items').doc(item.id).update(item.toFirestore());
  }

  Future<void> deleteItem(String id) async {
    await _db.collection('items').doc(id).delete();
  }
}
