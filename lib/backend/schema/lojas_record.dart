import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'lojas_record.g.dart';

abstract class LojasRecord implements Built<LojasRecord, LojasRecordBuilder> {
  static Serializer<LojasRecord> get serializer => _$lojasRecordSerializer;

  @nullable
  String get nome;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(LojasRecordBuilder builder) =>
      builder..nome = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('lojas');

  static Stream<LojasRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  static Future<LojasRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s)));

  LojasRecord._();
  factory LojasRecord([void Function(LojasRecordBuilder) updates]) =
      _$LojasRecord;

  static LojasRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createLojasRecordData({
  String nome,
}) =>
    serializers.toFirestore(
        LojasRecord.serializer, LojasRecord((l) => l..nome = nome));
