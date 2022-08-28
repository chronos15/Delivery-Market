// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'carrinho_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<CarrinhoRecord> _$carrinhoRecordSerializer =
    new _$CarrinhoRecordSerializer();

class _$CarrinhoRecordSerializer
    implements StructuredSerializer<CarrinhoRecord> {
  @override
  final Iterable<Type> types = const [CarrinhoRecord, _$CarrinhoRecord];
  @override
  final String wireName = 'CarrinhoRecord';

  @override
  Iterable<Object> serialize(Serializers serializers, CarrinhoRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    Object value;
    value = object.usuario;
    if (value != null) {
      result
        ..add('usuario')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType(Object)])));
    }
    value = object.codProduto;
    if (value != null) {
      result
        ..add('codProduto')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType(Object)])));
    }
    value = object.valorUnitario;
    if (value != null) {
      result
        ..add('valorUnitario')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    value = object.valorReg;
    if (value != null) {
      result
        ..add('valorReg')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    value = object.quantidade;
    if (value != null) {
      result
        ..add('quantidade')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
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
  CarrinhoRecord deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new CarrinhoRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object value = iterator.current;
      switch (key) {
        case 'usuario':
          result.usuario = serializers.deserialize(value,
                  specifiedType: const FullType(
                      DocumentReference, const [const FullType(Object)]))
              as DocumentReference<Object>;
          break;
        case 'codProduto':
          result.codProduto = serializers.deserialize(value,
                  specifiedType: const FullType(
                      DocumentReference, const [const FullType(Object)]))
              as DocumentReference<Object>;
          break;
        case 'valorUnitario':
          result.valorUnitario = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double;
          break;
        case 'valorReg':
          result.valorReg = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double;
          break;
        case 'quantidade':
          result.quantidade = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double;
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

class _$CarrinhoRecord extends CarrinhoRecord {
  @override
  final DocumentReference<Object> usuario;
  @override
  final DocumentReference<Object> codProduto;
  @override
  final double valorUnitario;
  @override
  final double valorReg;
  @override
  final double quantidade;
  @override
  final bool fechado;
  @override
  final DocumentReference<Object> reference;

  factory _$CarrinhoRecord([void Function(CarrinhoRecordBuilder) updates]) =>
      (new CarrinhoRecordBuilder()..update(updates))._build();

  _$CarrinhoRecord._(
      {this.usuario,
      this.codProduto,
      this.valorUnitario,
      this.valorReg,
      this.quantidade,
      this.fechado,
      this.reference})
      : super._();

  @override
  CarrinhoRecord rebuild(void Function(CarrinhoRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  CarrinhoRecordBuilder toBuilder() =>
      new CarrinhoRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is CarrinhoRecord &&
        usuario == other.usuario &&
        codProduto == other.codProduto &&
        valorUnitario == other.valorUnitario &&
        valorReg == other.valorReg &&
        quantidade == other.quantidade &&
        fechado == other.fechado &&
        reference == other.reference;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc($jc($jc(0, usuario.hashCode), codProduto.hashCode),
                        valorUnitario.hashCode),
                    valorReg.hashCode),
                quantidade.hashCode),
            fechado.hashCode),
        reference.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'CarrinhoRecord')
          ..add('usuario', usuario)
          ..add('codProduto', codProduto)
          ..add('valorUnitario', valorUnitario)
          ..add('valorReg', valorReg)
          ..add('quantidade', quantidade)
          ..add('fechado', fechado)
          ..add('reference', reference))
        .toString();
  }
}

class CarrinhoRecordBuilder
    implements Builder<CarrinhoRecord, CarrinhoRecordBuilder> {
  _$CarrinhoRecord _$v;

  DocumentReference<Object> _usuario;
  DocumentReference<Object> get usuario => _$this._usuario;
  set usuario(DocumentReference<Object> usuario) => _$this._usuario = usuario;

  DocumentReference<Object> _codProduto;
  DocumentReference<Object> get codProduto => _$this._codProduto;
  set codProduto(DocumentReference<Object> codProduto) =>
      _$this._codProduto = codProduto;

  double _valorUnitario;
  double get valorUnitario => _$this._valorUnitario;
  set valorUnitario(double valorUnitario) =>
      _$this._valorUnitario = valorUnitario;

  double _valorReg;
  double get valorReg => _$this._valorReg;
  set valorReg(double valorReg) => _$this._valorReg = valorReg;

  double _quantidade;
  double get quantidade => _$this._quantidade;
  set quantidade(double quantidade) => _$this._quantidade = quantidade;

  bool _fechado;
  bool get fechado => _$this._fechado;
  set fechado(bool fechado) => _$this._fechado = fechado;

  DocumentReference<Object> _reference;
  DocumentReference<Object> get reference => _$this._reference;
  set reference(DocumentReference<Object> reference) =>
      _$this._reference = reference;

  CarrinhoRecordBuilder() {
    CarrinhoRecord._initializeBuilder(this);
  }

  CarrinhoRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _usuario = $v.usuario;
      _codProduto = $v.codProduto;
      _valorUnitario = $v.valorUnitario;
      _valorReg = $v.valorReg;
      _quantidade = $v.quantidade;
      _fechado = $v.fechado;
      _reference = $v.reference;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(CarrinhoRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$CarrinhoRecord;
  }

  @override
  void update(void Function(CarrinhoRecordBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  CarrinhoRecord build() => _build();

  _$CarrinhoRecord _build() {
    final _$result = _$v ??
        new _$CarrinhoRecord._(
            usuario: usuario,
            codProduto: codProduto,
            valorUnitario: valorUnitario,
            valorReg: valorReg,
            quantidade: quantidade,
            fechado: fechado,
            reference: reference);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
