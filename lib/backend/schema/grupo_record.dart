import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'grupo_record.g.dart';

abstract class GrupoRecord implements Built<GrupoRecord, GrupoRecordBuilder> {
  static Serializer<GrupoRecord> get serializer => _$grupoRecordSerializer;

  @nullable
  String get nome;

  @nullable
  DocumentReference get codCategoria;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(GrupoRecordBuilder builder) =>
      builder..nome = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('grupo');

  static Stream<GrupoRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  static Future<GrupoRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s)));

  GrupoRecord._();
  factory GrupoRecord([void Function(GrupoRecordBuilder) updates]) =
      _$GrupoRecord;

  static GrupoRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createGrupoRecordData({
  String nome,
  DocumentReference codCategoria,
}) =>
    serializers.toFirestore(
        GrupoRecord.serializer,
        GrupoRecord((g) => g
          ..nome = nome
          ..codCategoria = codCategoria));
