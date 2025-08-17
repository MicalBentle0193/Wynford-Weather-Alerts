import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/warning_model.dart';

class FirestoreService {
  final CollectionReference warningsCollection = FirebaseFirestore.instance.collection('warnings');

  Future<void> addWarning(Warning warning) async {
    await warningsCollection.add(warning.toMap());
  }

  Stream<List<Warning>> getActiveWarnings() {
    return warningsCollection
        .where('active', isEqualTo: true)
        .orderBy('timestamp', descending: true)
        .snapshots()
        .map((snapshot) => snapshot.docs.map((doc) => Warning.fromMap(doc.data() as Map<String, dynamic>)).toList());
  }

  Future<void> deactivateWarning(String docId) async {
    await warningsCollection.doc(docId).update({'active': false});
  }
}
