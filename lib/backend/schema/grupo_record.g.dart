// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'grupo_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GrupoRecord> _$grupoRecordSerializer = new _$GrupoRecordSerializer();

class _$GrupoRecordSerializer implements StructuredSerializer<GrupoRecord> {
  @override
  final Iterable<Type> types = const [GrupoRecord, _$GrupoRecord];
  @override
  final String wireName = 'GrupoRecord';

  @override
  Iterable<Object> serialize(Serializers serializers, GrupoRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    Object value;
    value = object.nome;
    if (value != null) {
      result
        ..add('nome')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.codCategoria;
    if (value != null) {
      result
        ..add('codCategoria')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType(Object)])));
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
  GrupoRecord deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GrupoRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object value = iterator.current;
      switch (key) {
        case 'nome':
          result.nome = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'codCategoria':
          result.codCategoria = serializers.deserialize(value,
                  specifiedType: const FullType(
                      DocumentReference, const [const FullType(Object)]))
              as DocumentReference<Object>;
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

class _$GrupoRecord extends GrupoRecord {
  @override
  final String nome;
  @override
  final DocumentReference<Object> codCategoria;
  @override
  final DocumentReference<Object> reference;

  factory _$GrupoRecord([void Function(GrupoRecordBuilder) updates]) =>
      (new GrupoRecordBuilder()..update(updates))._build();

  _$GrupoRecord._({this.nome, this.codCategoria, this.reference}) : super._();

  @override
  GrupoRecord rebuild(void Function(GrupoRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GrupoRecordBuilder toBuilder() => new GrupoRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GrupoRecord &&
        nome == other.nome &&
        codCategoria == other.codCategoria &&
        reference == other.reference;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc(0, nome.hashCode), codCategoria.hashCode), reference.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GrupoRecord')
          ..add('nome', nome)
          ..add('codCategoria', codCategoria)
          ..add('reference', reference))
        .toString();
  }
}

class GrupoRecordBuilder implements Builder<GrupoRecord, GrupoRecordBuilder> {
  _$GrupoRecord _$v;

  String _nome;
  String get nome => _$this._nome;
  set nome(String nome) => _$this._nome = nome;

  DocumentReference<Object> _codCategoria;
  DocumentReference<Object> get codCategoria => _$this._codCategoria;
  set codCategoria(DocumentReference<Object> codCategoria) =>
      _$this._codCategoria = codCategoria;

  DocumentReference<Object> _reference;
  DocumentReference<Object> get reference => _$this._reference;
  set reference(DocumentReference<Object> reference) =>
      _$this._reference = reference;

  GrupoRecordBuilder() {
    GrupoRecord._initializeBuilder(this);
  }

  GrupoRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _nome = $v.nome;
      _codCategoria = $v.codCategoria;
      _reference = $v.reference;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GrupoRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GrupoRecord;
  }

  @override
  void update(void Function(GrupoRecordBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  GrupoRecord build() => _build();

  _$GrupoRecord _build() {
    final _$result = _$v ??
        new _$GrupoRecord._(
            nome: nome, codCategoria: codCategoria, reference: reference);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
