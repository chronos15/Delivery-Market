// Automatic FlutterFlow imports
import '../../backend/backend.dart';
import '../../flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '../../flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';

// Begin custom action code
Future batchUpdate(
  List<DocumentReference> updateCollection,
  String updateField,
  bool currentValue,
  bool newValue,
) async {
  CollectionReference collectionRef =
      FirebaseFirestore.instance.collection('carrinho');

  WriteBatch batch = FirebaseFirestore.instance.batch();

  collectionRef
      .where(updateField, isEqualTo: currentValue)
      .get()
      .then((querySnapshot) {
    querySnapshot.docs.forEach((document) {
      batch.update(document.reference, {updateField: newValue});
    });
    return batch.commit();
  });
}
