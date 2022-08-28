import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'pedidos_record.g.dart';

abstract class PedidosRecord
    implements Built<PedidosRecord, PedidosRecordBuilder> {
  static Serializer<PedidosRecord> get serializer => _$pedidosRecordSerializer;

  @nullable
  DocumentReference get userCod;

  @nullable
  BuiltList<DocumentReference> get produtosCart;

  @nullable
  double get total;

  @nullable
  DateTime get data;

  @nullable
  String get situacao;

  @nullable
  bool get fechado;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(PedidosRecordBuilder builder) => builder
    ..produtosCart = ListBuilder()
    ..total = 0.0
    ..situacao = ''
    ..fechado = false;

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('pedidos');

  static Stream<PedidosRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  static Future<PedidosRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s)));

  PedidosRecord._();
  factory PedidosRecord([void Function(PedidosRecordBuilder) updates]) =
      _$PedidosRecord;

  static PedidosRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createPedidosRecordData({
  DocumentReference userCod,
  double total,
  DateTime data,
  String situacao,
  bool fechado,
}) =>
    serializers.toFirestore(
        PedidosRecord.serializer,
        PedidosRecord((p) => p
          ..userCod = userCod
          ..produtosCart = null
          ..total = total
          ..data = data
          ..situacao = situacao
          ..fechado = fechado));
