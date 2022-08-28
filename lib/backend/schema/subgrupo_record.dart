import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'subgrupo_record.g.dart';

abstract class SubgrupoRecord
    implements Built<SubgrupoRecord, SubgrupoRecordBuilder> {
  static Serializer<SubgrupoRecord> get serializer =>
      _$subgrupoRecordSerializer;

  @nullable
  String get nome;

  @nullable
  DocumentReference get codgrupo;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(SubgrupoRecordBuilder builder) =>
      builder..nome = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('subgrupo');

  static Stream<SubgrupoRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  static Future<SubgrupoRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s)));

  SubgrupoRecord._();
  factory SubgrupoRecord([void Function(SubgrupoRecordBuilder) updates]) =
      _$SubgrupoRecord;

  static SubgrupoRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createSubgrupoRecordData({
  String nome,
  DocumentReference codgrupo,
}) =>
    serializers.toFirestore(
        SubgrupoRecord.serializer,
        SubgrupoRecord((s) => s
          ..nome = nome
          ..codgrupo = codgrupo));
