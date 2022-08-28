// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pedidos_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<PedidosRecord> _$pedidosRecordSerializer =
    new _$PedidosRecordSerializer();

class _$PedidosRecordSerializer implements StructuredSerializer<PedidosRecord> {
  @override
  final Iterable<Type> types = const [PedidosRecord, _$PedidosRecord];
  @override
  final String wireName = 'PedidosRecord';

  @override
  Iterable<Object> serialize(Serializers serializers, PedidosRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    Object value;
    value = object.userCod;
    if (value != null) {
      result
        ..add('userCod')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType(Object)])));
    }
    value = object.produtosCart;
    if (value != null) {
      result
        ..add('produtosCart')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(BuiltList, const [
              const FullType(DocumentReference, const [const FullType(Object)])
            ])));
    }
    value = object.total;
    if (value != null) {
      result
        ..add('total')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    value = object.data;
    if (value != null) {
      result
        ..add('data')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.situacao;
    if (value != null) {
      result
        ..add('situacao')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.fechado;
    if (value != null) {
      result
        ..add('fechado')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.reference;
    if (value != null) {
      result
        ..add('Document__Reference__Field')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType(Object)])));
    }
    return result;
  }

  @override
  PedidosRecord deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new PedidosRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object value = iterator.current;
      switch (key) {
        case 'userCod':
          result.userCod = serializers.deserialize(value,
                  specifiedType: const FullType(
                      DocumentReference, const [const FullType(Object)]))
              as DocumentReference<Object>;
          break;
        case 'produtosCart':
          result.produtosCart.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltList, const [
                const FullType(
                    DocumentReference, const [const FullType(Object)])
              ])) as BuiltList<Object>);
          break;
        case 'total':
          result.total = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double;
          break;
        case 'data':
          result.data = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime;
          break;
        case 'situacao':
          result.situacao = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'fechado':
          result.fechado = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
        case 'Document__Reference__Field':
          result.reference = serializers.deserialize(value,
                  specifiedType: const FullType(
                      DocumentReference, const [const FullType(Object)]))
              as DocumentReference<Object>;
          break;
      }
    }

    return result.build();
  }
}

class _$PedidosRecord extends PedidosRecord {
  @override
  final DocumentReference<Object> userCod;
  @override
  final BuiltList<DocumentReference<Object>> produtosCart;
  @override
  final double total;
  @override
  final DateTime data;
  @override
  final String situacao;
  @override
  final bool fechado;
  @override
  final DocumentReference<Object> reference;

  factory _$PedidosRecord([void Function(PedidosRecordBuilder) updates]) =>
      (new PedidosRecordBuilder()..update(updates))._build();

  _$PedidosRecord._(
      {this.userCod,
      this.produtosCart,
      this.total,
      this.data,
      this.situacao,
      this.fechado,
      this.reference})
      : super._();

  @override
  PedidosRecord rebuild(void Function(PedidosRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  PedidosRecordBuilder toBuilder() => new PedidosRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is PedidosRecord &&
        userCod == other.userCod &&
        produtosCart == other.produtosCart &&
        total == other.total &&
        data == other.data &&
        situacao == other.situacao &&
        fechado == other.fechado &&
        reference == other.reference;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc($jc($jc(0, userCod.hashCode), produtosCart.hashCode),
                        total.hashCode),
                    data.hashCode),
                situacao.hashCode),
            fechado.hashCode),
        reference.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'PedidosRecord')
          ..add('userCod', userCod)
          ..add('produtosCart', produtosCart)
          ..add('total', total)
          ..add('data', data)
          ..add('situacao', situacao)
          ..add('fechado', fechado)
          ..add('reference', reference))
        .toString();
  }
}

class PedidosRecordBuilder
    implements Builder<PedidosRecord, PedidosRecordBuilder> {
  _$PedidosRecord _$v;

  DocumentReference<Object> _userCod;
  DocumentReference<Object> get userCod => _$this._userCod;
  set userCod(DocumentReference<Object> userCod) => _$this._userCod = userCod;

  ListBuilder<DocumentReference<Object>> _produtosCart;
  ListBuilder<DocumentReference<Object>> get produtosCart =>
      _$this._produtosCart ??= new ListBuilder<DocumentReference<Object>>();
  set produtosCart(ListBuilder<DocumentReference<Object>> produtosCart) =>
      _$this._produtosCart = produtosCart;

  double _total;
  double get total => _$this._total;
  set total(double total) => _$this._total = total;

  DateTime _data;
  DateTime get data => _$this._data;
  set data(DateTime data) => _$this._data = data;

  String _situacao;
  String get situacao => _$this._situacao;
  set situacao(String situacao) => _$this._situacao = situacao;

  bool _fechado;
  bool get fechado => _$this._fechado;
  set fechado(bool fechado) => _$this._fechado = fechado;

  DocumentReference<Object> _reference;
  DocumentReference<Object> get reference => _$this._reference;
  set reference(DocumentReference<Object> reference) =>
      _$this._reference = reference;

  PedidosRecordBuilder() {
    PedidosRecord._initializeBuilder(this);
  }

  PedidosRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _userCod = $v.userCod;
      _produtosCart = $v.produtosCart?.toBuilder();
      _total = $v.total;
      _data = $v.data;
      _situacao = $v.situacao;
      _fechado = $v.fechado;
      _reference = $v.reference;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(PedidosRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$PedidosRecord;
  }

  @override
  void update(void Function(PedidosRecordBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  PedidosRecord build() => _build();

  _$PedidosRecord _build() {
    _$PedidosRecord _$result;
    try {
      _$result = _$v ??
          new _$PedidosRecord._(
              userCod: userCod,
              produtosCart: _produtosCart?.build(),
              total: total,
              data: data,
              situacao: situacao,
              fechado: fechado,
              reference: reference);
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'produtosCart';
        _produtosCart?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'PedidosRecord', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
