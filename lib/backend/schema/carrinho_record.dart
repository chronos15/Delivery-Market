import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'carrinho_record.g.dart';

abstract class CarrinhoRecord
    implements Built<CarrinhoRecord, CarrinhoRecordBuilder> {
  static Serializer<CarrinhoRecord> get serializer =>
      _$carrinhoRecordSerializer;

  @nullable
  DocumentReference get usuario;

  @nullable
  DocumentReference get codProduto;

  @nullable
  double get valorUnitario;

  @nullable
  double get valorReg;

  @nullable
  double get quantidade;

  @nullable
  bool get fechado;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(CarrinhoRecordBuilder builder) => builder
    ..valorUnitario = 0.0
    ..valorReg = 0.0
    ..quantidade = 0.0
    ..fechado = false;

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('carrinho');

  static Stream<CarrinhoRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  static Future<CarrinhoRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s)));

  CarrinhoRecord._();
  factory CarrinhoRecord([void Function(CarrinhoRecordBuilder) updates]) =
      _$CarrinhoRecord;

  static CarrinhoRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createCarrinhoRecordData({
  DocumentReference usuario,
  DocumentReference codProduto,
  double valorUnitario,
  double valorReg,
  double quantidade,
  bool fechado,
}) =>
    serializers.toFirestore(
        CarrinhoRecord.serializer,
        CarrinhoRecord((c) => c
          ..usuario = usuario
          ..codProduto = codProduto
          ..valorUnitario = valorUnitario
          ..valorReg = valorReg
          ..quantidade = quantidade
          ..fechado = fechado));
