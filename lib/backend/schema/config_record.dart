import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'config_record.g.dart';

abstract class ConfigRecord
    implements Built<ConfigRecord, ConfigRecordBuilder> {
  static Serializer<ConfigRecord> get serializer => _$configRecordSerializer;

  @nullable
  String get razSocial;

  @nullable
  String get nomeFant;

  @nullable
  String get cnpj;

  @nullable
  String get logoEmp;

  @nullable
  double get metaDiaria;

  @nullable
  double get metaSemanal;

  @nullable
  double get metaMensal;

  @nullable
  BuiltList<String> get carroselImg;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(ConfigRecordBuilder builder) => builder
    ..razSocial = ''
    ..nomeFant = ''
    ..cnpj = ''
    ..logoEmp = ''
    ..metaDiaria = 0.0
    ..metaSemanal = 0.0
    ..metaMensal = 0.0
    ..carroselImg = ListBuilder();

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('config');

  static Stream<ConfigRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  static Future<ConfigRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s)));

  ConfigRecord._();
  factory ConfigRecord([void Function(ConfigRecordBuilder) updates]) =
      _$ConfigRecord;

  static ConfigRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createConfigRecordData({
  String razSocial,
  String nomeFant,
  String cnpj,
  String logoEmp,
  double metaDiaria,
  double metaSemanal,
  double metaMensal,
}) =>
    serializers.toFirestore(
        ConfigRecord.serializer,
        ConfigRecord((c) => c
          ..razSocial = razSocial
          ..nomeFant = nomeFant
          ..cnpj = cnpj
          ..logoEmp = logoEmp
          ..metaDiaria = metaDiaria
          ..metaSemanal = metaSemanal
          ..metaMensal = metaMensal
          ..carroselImg = null));
