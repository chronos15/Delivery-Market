import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'produtos_record.g.dart';

abstract class ProdutosRecord
    implements Built<ProdutosRecord, ProdutosRecordBuilder> {
  static Serializer<ProdutosRecord> get serializer =>
      _$produtosRecordSerializer;

  @nullable
  String get descricao;

  @nullable
  DocumentReference get codsubgrupo;

  @nullable
  double get valorAvista;

  @nullable
  BuiltList<String> get image;

  @nullable
  String get imageIcon;

  @nullable
  String get gtin;

  @nullable
  String get ref;

  @nullable
  bool get promocao;

  @nullable
  int get rating;

  @nullable
  double get quanti;

  @nullable
  DocumentReference get codgrupo;

  @nullable
  String get imagePrincipal;

  @nullable
  String get detalhes;

  @nullable
  double get estoque;

  @nullable
  BuiltList<String> get tipo;

  @nullable
  String get unidadeS;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(ProdutosRecordBuilder builder) => builder
    ..descricao = ''
    ..valorAvista = 0.0
    ..image = ListBuilder()
    ..imageIcon = ''
    ..gtin = ''
    ..ref = ''
    ..promocao = false
    ..rating = 0
    ..quanti = 0.0
    ..imagePrincipal = ''
    ..detalhes = ''
    ..estoque = 0.0
    ..tipo = ListBuilder()
    ..unidadeS = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('produtos');

  static Stream<ProdutosRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  static Future<ProdutosRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s)));

  ProdutosRecord._();
  factory ProdutosRecord([void Function(ProdutosRecordBuilder) updates]) =
      _$ProdutosRecord;

  static ProdutosRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createProdutosRecordData({
  String descricao,
  DocumentReference codsubgrupo,
  double valorAvista,
  String imageIcon,
  String gtin,
  String ref,
  bool promocao,
  int rating,
  double quanti,
  DocumentReference codgrupo,
  String imagePrincipal,
  String detalhes,
  double estoque,
  String unidadeS,
}) =>
    serializers.toFirestore(
        ProdutosRecord.serializer,
        ProdutosRecord((p) => p
          ..descricao = descricao
          ..codsubgrupo = codsubgrupo
          ..valorAvista = valorAvista
          ..image = null
          ..imageIcon = imageIcon
          ..gtin = gtin
          ..ref = ref
          ..promocao = promocao
          ..rating = rating
          ..quanti = quanti
          ..codgrupo = codgrupo
          ..imagePrincipal = imagePrincipal
          ..detalhes = detalhes
          ..estoque = estoque
          ..tipo = null
          ..unidadeS = unidadeS));
